#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sstream>
#include <string.h>
#include <cmath>
#include <algorithm>
#include <arpa/inet.h>
#include <sys/time.h>
#include <netinet/in.h>
#include <errno.h>
#include <time.h>
#include <iostream>
#include "udp_server.h"

  UdpServer::UdpServer(int rwnd)
  {
    sliding_window_=std::make_unique<SlidingWindow>();
    packet_statistics_=std::make_unique<PacketStatistics>();

    sockfd_=0;
    smoothed_rtt_=20000;
    smoothed_timeout_=30000;
    dev_rtt_=0;

    initial_seq_number_=23;
    start_byte_=0;

    ssthresh_=128;
    cwnd_=1;
    rwnd_=rwnd;

    is_slow_start_=true;
    is_cong_avd_=false;
    is_fast_recovery_=false;
  }

      int UdpServer::StartServer(int port)
  {
     int fd_=0;
     struct sockaddr_in server_addr;
     memset(&server_addr, 0, sizeof(server_addr));
     server_addr.sin_family = AF_INET;
     server_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
     server_addr.sin_port = htons(port);

     std::cout<<"start the server...    port:    "<<port<<std::endl;
     fd_=::socket(AF_INET,SOCK_DGRAM,0);
     if(fd_<0)
     {
       std::cout<<"Failed to socket !!!\n";
       exit(1);
     }   
      
      if(bind(fd_,(struct sockaddr*)&server_addr,sizeof(server_addr))==-1)
      {
      std::cout<<"binding error !!!, The error is "<<errno<<std::endl;
      exit(1);
      }
      

      std::cout<<"STARTED SUCCESSFULLY\n";
      sockfd_=fd_;
      return fd_;
  }

   bool UdpServer::OpenFile(const std::string &file_name) {
    std::cout << "Opening the file " << file_name<<std::endl;

    file_.open(file_name.c_str(), std::ios::in);
    if (!this->file_.is_open()) {
    std::cout << "File: " << file_name << " opening failed\n";
    return false;
  } else {
    std::cout << "File: " << file_name << " opening success\n";
    return true;
  }
}
   

   void UdpServer::StartFileTransfer() {
     std::cout<<"Starting the file_ transfer\n ";
     file_.seekg(0, std::ios::end);
     file_length_ = file_.tellg();
     file_.seekg(0, std::ios::beg);

  send();
}

  void UdpServer::SendError() {
  std::string error("FILE NOT FOUND");
  sendto(sockfd_, error.c_str(), error.size(), 0,
         (struct sockaddr *)&cli_address_, sizeof(cli_address_));
}

  void UdpServer::send()
  {
    std::cout<<"Entering Send()\n";

    int sent_count=1;
    int sent_count_limit=1;

    struct timeval process_start_time;
    struct timeval process_end_time;
    ::gettimeofday(&process_start_time,nullptr);

    if(sliding_window_->last_packet_sent_==-1)
    {
      start_byte_=0;
    }

    while(start_byte_<=file_length_)
    {    
         fd_set rfds;
         struct timeval tv;
         int res;

         sent_count=1;
         sent_count_limit=std::min(rwnd_,cwnd_);//rwnd_ 设置的固定窗口大小
        /*
  ||||||||........|...................|............................|
                  |                   |                            |
          last_acked_packet_   last_send_packet_            last_acked_packet_+rwnd_
                         窗口范围每次都已是last_acked_packet_往后扩展rwnd_
        */
         std::cout<<"SEND START!!!\n";
         std::cout<<"Before the window rwnd_: " << rwnd_ << " cwnd_: " << cwnd_
         <<"  window used: "<<sliding_window_->last_packet_sent_-sliding_window_->last_acked_packet_<<std::endl;

         while(sliding_window_->last_packet_sent_-sliding_window_->last_acked_packet_
         <=std::min(rwnd_,cwnd_)&&sent_count<=sent_count_limit)//发送数量小于门限且剩下的窗口数小于门限,未进入循环说明发的包多了 最坏情况 所有包都没了 进行全部重传
         {
            send_packet(start_byte_+initial_seq_number_,start_byte_);

            if (is_slow_start_) {
        // LOG(INFO) << "Window In SLOW START Window";
        packet_statistics_->slow_start_packet_sent_count_++;
            } else if (is_cong_avd_) {
        // LOG(INFO) << "Window In CONG AVD Window";
        packet_statistics_->cong_avd_packet_sent_count_++;
            }  //数量统计
             
             start_byte_=start_byte_+MAX_DATA_SIZE;
             if(start_byte_>file_length_)
             {
             std::cout<<"No more data left to be sent\n";
              break;
             }
             sent_count++;
         }//发送完毕

            std::cout<<"SEND END !!!\n";

             FD_ZERO(&rfds);
             FD_SET(sockfd_, &rfds);            
             tv.tv_sec = (int64_t)smoothed_timeout_ / 1000000;
             tv.tv_usec = smoothed_timeout_ - tv.tv_sec;
             std::cout<<"SELECT START !!!\n";
            while(1)
            {
                 res = select(sockfd_ + 1, &rfds, NULL, NULL, &tv);
                  if (res == -1) {
                  std::cout<<"Error in select\n";
               } else if (res > 0) {  // ACK available event
                  wait_for_ack();//如果接受 更新了sent_base

                   if (cwnd_ >= ssthresh_) {
                    //慢启动---->拥塞避免
                     std::cout<<"CHANGE TO CONG AVD\n";
                     is_cong_avd_ = true;
                     is_slow_start_ = false;

                    cwnd_ = 1;
                    ssthresh_ = 64;
             }
               
             if(sliding_window_->last_packet_sent_==sliding_window_->last_acked_packet_)//数据包都受到了
             {
              if(is_slow_start_)
              {
                cwnd_*=2;
              }else
              {
                 cwnd_+=1;
              }
               break;
             }
               }else {//超时 超时重传
                  std::cout<<"Timeout occurred SELECT:: "<<smoothed_rtt_<<std::endl;
                  ssthresh_=cwnd_/2;
                  if(ssthresh_<1)
                  {
                    ssthresh_=1;
                  }
                  cwnd_=1;
                  /*阈值减半 门限变为1*/
                  //重新开始慢启动 
                  if(is_fast_recovery_){
                    is_fast_recovery_=false;
                  }
                  is_slow_start_=true;
                  is_cong_avd_=false;

                  for(int i=sliding_window_->last_acked_packet_+1;i<=sliding_window_->last_packet_sent_;i++)
                  {
                    int retransmit_start_byte=0;
                    if(sliding_window_->last_acked_packet_!=-1)
                     retransmit_start_byte=sliding_window_->sliding_window_buffers_[sliding_window_->last_acked_packet_].first_byte_+MAX_DATA_SIZE;//跳过acked一个包=send_base
                    std::cout << "Timeout Retransmit seq number "
                    << retransmit_start_byte + initial_seq_number_<<std::endl;
                    retransmit_segment(retransmit_start_byte);
                    packet_statistics_->retransmit_count_++;
                   std::cout<< "Timeout: retransmission at " << retransmit_start_byte<<std::endl;
                  }
                    break;
               }
         }
                std::cout << "SELECT END !!!\n";
                std::cout << "current byte ::" << start_byte_ << " file_length_"
              << file_length_<<std::endl;
    }
               gettimeofday(&process_end_time, NULL);
              int64_t total_time =
      (process_end_time.tv_sec * 1000000 + process_end_time.tv_usec) -
      (process_start_time.tv_sec * 1000000 + process_start_time.tv_usec);

  int total_packet_sent = packet_statistics_->slow_start_packet_sent_count_ +
                          packet_statistics_->cong_avd_packet_sent_count_;
  std::cout << "\n";
  std::cout << "========================================\n";
  std::cout<< "Total Time: " << (float)total_time / pow(10, 6) << " secs\n";
  std::cout << "Statistics: 拥塞控制--慢启动: "
            << packet_statistics_->slow_start_packet_sent_count_
            << " 拥塞控制--拥塞避免: "
            << packet_statistics_->cong_avd_packet_sent_count_<<std::endl;
  std::cout << "Statistics: Slow start: "
            << ((float)packet_statistics_->slow_start_packet_sent_count_ /
                total_packet_sent) *
                   100
            << "% CongAvd: "
            << ((float)packet_statistics_->cong_avd_packet_sent_count_ /
                total_packet_sent) *
                   100
            << "%\n";
  std::cout << "Statistics: Retransmissions: "
            << packet_statistics_->retransmit_count_<<std::endl;
 std::cout << "========================================\n";
  }
 

 void UdpServer::send_packet(int seq_number,int start_byte)
 {
  bool lastpacket=false;
  int datalength=0;
  if(file_length_<=start_byte_+MAX_DATA_SIZE)
{
     std::cout<<"Last packet to be sent\n";
     datalength=file_length_-start_byte;
     lastpacket=true;   
} else {
   datalength=MAX_DATA_SIZE;
}

   struct timeval time;
   gettimeofday(&time,nullptr);

   if(sliding_window_->last_packet_sent_!=-1&&//防止开始情况
   start_byte<sliding_window_->sliding_window_buffers_[sliding_window_->last_packet_sent_].first_byte_){
    for(int i=sliding_window_->last_acked_packet_+1;i<sliding_window_->last_packet_sent_;i++)
    {
           if(sliding_window_->sliding_window_buffers_[i].first_byte_==start_byte)
           {
            sliding_window_->sliding_window_buffers_[i].time_sent_=time;
            break;
           }//包发过去，出现丢失 进行重新发包 更新此处的时间戳
    }
   } else {
        SlidWinBuffer buffer;
        buffer.data_length_=datalength;
        buffer.first_byte_=start_byte;
        buffer.seq_num_=start_byte+initial_seq_number_;
        struct timeval time;
        gettimeofday(&time, nullptr);
        buffer.time_sent_=time;
        sliding_window_->last_packet_sent_=sliding_window_->AddToBuffer(buffer);//更新下标
   }
   read_file_and_send(lastpacket,start_byte,start_byte+datalength);

 }

 void UdpServer::read_file_and_send(bool fin_falg,int start_byte,int end_byte)
 {
     int datalength=end_byte-start_byte;
     if(file_length_-start_byte<datalength)
     {
  datalength=file_length_-start_byte;
  fin_falg=true;
     }
      char *fileData = reinterpret_cast<char *>(calloc(datalength, sizeof(char)));
      if(!file_.is_open())
      {
       std::cout<<"File open failed !!!\n";
       return ;
      }

      file_.seekg(start_byte);
      file_.read(fileData, datalength);
      DataSegment* data_segment=new DataSegment();
      data_segment->seq_number_ = start_byte + initial_seq_number_;
      data_segment->ack_number_ = 0;
      data_segment->ack_flag_ = false;
      data_segment->fin_flag_ = fin_falg;
      data_segment->length_ = datalength;
      data_segment->data_ = fileData;

       send_data_segment(data_segment);//序列化发送
       std::cout<<"Packet sent:seq number: " << data_segment->seq_number_<<std::endl;

       free(fileData);
       free(data_segment);
 }

 void UdpServer::wait_for_ack()
 {

  std::cout<<"WAIT_FOR_ACK START !!!\n";
  unsigned char buffer[MAX_PACKET_SIZE];
  ::memset(buffer,0,MAX_PACKET_SIZE);
  socklen_t address;
  struct sockaddr_in clint_addr;
  ::memset(&clint_addr,0,sizeof(clint_addr));
  address=sizeof(clint_addr);
  int n=0;
  int ack_number;
  while((n=recvfrom(sockfd_,buffer,MAX_PACKET_SIZE,0,(struct sockaddr*)&clint_addr,&address))<=0)
  {

  };
  DataSegment ack_segment;
  ack_segment.DeserializeToDataSegment(buffer,n);
  std::cout<<"receive the ack_segment, the ack_number is "<<ack_segment.ack_number_<<std::endl;
  SlidWinBuffer last_packet_acked_buffer;
  if(sliding_window_->last_acked_packet_!=-1)
  last_packet_acked_buffer=sliding_window_->sliding_window_buffers_[sliding_window_->last_acked_packet_];

  if(ack_segment.ack_flag_)
  {
           if(ack_segment.ack_number_==sliding_window_->send_base_)//这一轮，进入wait_for_ack阶段这一次的send_base_是上一次wait_for_ack的ack_number
           {                                                       //上一次wait_for_ack完毕后 开始这一轮send()，这一轮的发送就是上一轮对面的ack_number，也就是这一轮的send_base（上一轮更新）
                                                                  //send()后进入，这一轮wait_for_ack()中 对面发过来的包是下一次send()的请求 如果这一轮send()都收到,这一轮wait_for_ack()的ack_number
                                                                  //大于次数的send_base=上一次wait_for_ack()的ack_number，说明上一次发送的都接收到，对面两个的请求在正常状态下肯定是不同的
                std::cout<< "DUP ACK Received: ack_number: " << ack_segment.ack_number_<<std::endl;
                sliding_window_->dup_ack_++;
                //快速重传
                if (sliding_window_->dup_ack_ == 3) {
                packet_statistics_->retransmit_count_++;
                std::cout << "Fast Retransmit seq_number: " << ack_segment.ack_number_<<std::endl;
        retransmit_segment(ack_segment.ack_number_ - initial_seq_number_);
        sliding_window_->dup_ack_ = 0;
        if (cwnd_ > 1) {
          cwnd_ = cwnd_ / 2;
        }
        ssthresh_ = cwnd_;
        is_fast_recovery_ = true;
        // LOG_INFO<< "Change to fast Recovery ack_segment->ack_number:"
        //           << ack_segment->ack_number_;
      }
           }
           else if(ack_segment.ack_number_>sliding_window_->send_base_)
           {
                         if (is_fast_recovery_) {//上一轮发生拥塞 但这轮没有 那么进行块重传恢复
        // LOG_INFO << "Change to Cong Avoidance from fast recovery recv ack:"
        //           << ack_segment->ack_number_;
                       cwnd_++;
                       is_fast_recovery_ = false;
                       is_cong_avd_ = true;
                       is_slow_start_ = false;
           }

           sliding_window_->dup_ack_=0;
           sliding_window_->send_base_=ack_segment.ack_number_;//！！！
           if(sliding_window_->last_acked_packet_==-1)//这里说明第一个包成功，更新其实数据为0
           {
             sliding_window_->last_acked_packet_=0;
             last_packet_acked_buffer =
             sliding_window_
                ->sliding_window_buffers_[sliding_window_->last_acked_packet_];//防止出现角标问题
           }
           ack_number=last_packet_acked_buffer.seq_num_+last_packet_acked_buffer.data_length_;//我方的接受的包的后一包，都是没有确认收到的

           while(ack_number<ack_segment.ack_number_)//连续的情况 ack_number=ack_segment.ack_number，这里说明[ack_number,ack_segment.ack_number)都以收到
           {
            sliding_window_->last_acked_packet_++;//更新
            last_packet_acked_buffer=sliding_window_->sliding_window_buffers_[sliding_window_->last_acked_packet_];
            ack_number = last_packet_acked_buffer.seq_num_ +
                     last_packet_acked_buffer.data_length_;
           }//不断更新
           
           struct timeval startTime=last_packet_acked_buffer.time_sent_;
           struct timeval endTime;
           gettimeofday(&endTime,nullptr);

           calculate_rtt_and_time(startTime, endTime);//计算RTT
  }
  }
  std::cout<<"WAIT_FOR_ACK END !!!\n";
 }

  void UdpServer::calculate_rtt_and_time(struct timeval start_time,
                                       struct timeval end_time) {
  if (start_time.tv_sec == 0 && start_time.tv_usec == 0) {
    return;
  }
  long sample_rtt = (end_time.tv_sec * 1000000 + end_time.tv_usec) -
                    (start_time.tv_sec * 1000000 + start_time.tv_usec);

  smoothed_rtt_ = smoothed_rtt_ + 0.125 * (sample_rtt - smoothed_rtt_);

  dev_rtt_ = 0.75 * dev_rtt_ + 0.25 * (abs(smoothed_rtt_ - sample_rtt));
  smoothed_timeout_ = smoothed_rtt_ + 4 * dev_rtt_;

  if (smoothed_timeout_ > 1000000) {
    smoothed_timeout_ = rand() % 30000;
  }
}

 char* UdpServer::GetRequest(int client_sockfd)
 {
    char* buf=reinterpret_cast<char *>(calloc(MAX_PACKET_SIZE, sizeof(char)));
    struct sockaddr_in client_address;
    socklen_t addr_size;
    ::memset(buf,0,sizeof(buf));
    ::memset(&client_address,0,sizeof(client_address));
    addr_size=sizeof(addr_size);
    recvfrom(client_sockfd,buf,sizeof(buf),0,(struct sockaddr*)&client_address,&addr_size);
    std::cout<<"***Request recvived is: "<<buf<<std::endl;
    cli_address_=client_address;
    return buf;
 }

   void UdpServer::retransmit_segment(int index_number) {
     
         for (int i = sliding_window_->last_acked_packet_ + 1;
                     i <sliding_window_->last_packet_sent_; i++) {
    if (sliding_window_->sliding_window_buffers_[i].first_byte_ ==
        index_number) {
      struct timeval time;
      gettimeofday(&time, NULL);//已经记录在其中 所以要更新时间戳
      sliding_window_->sliding_window_buffers_[i].time_sent_ = time;
      break;
    }
  }
  read_file_and_send(false, index_number, index_number + MAX_DATA_SIZE);//重发
}


 void UdpServer::send_data_segment(DataSegment* data)
 {
  char* message=data->SerializeToCharArray();
  sendto(sockfd_,message,MAX_PACKET_SIZE,0,(struct sockaddr*)&cli_address_,sizeof(cli_address_));//udp传输不需要连接对面套接字
  free(message);//里面也动态开辟了 不要忘了删除
 }

 /*我方发送包的ack_number=0,滑动窗口是三指针*/
 /*我放存的是sliding_window 对方存的是data_segment*/