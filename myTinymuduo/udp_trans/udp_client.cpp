#include "udp_client.h"
#include "data_segment.cpp"
#include <string>
#include <netdb.h>
#include <string.h>
#include <stdlib.h>
#include <fstream>
#include <unistd.h>
#include <iostream>
#include <memory>
#include <sstream>
#include <arpa/inet.h>

     
     UdpClient::UdpClient(bool a,bool b)
     {
        ::memset(&cline_address,0,sizeof(cline_address));
        sockfd_=0;
        initial_seq_number_=23;
        last_in_order_packet_=-1;//最近一次我方成功接受到对面包的下标，[0,last_in_order_packet]全部收到
        last_packet_received_=-1;//可能跳段
        fin_flag_received_=false;
        is_delay_=a;
        is_packet_drop_=b;
     }

     void UdpClient::SendFileRequest(const std::string& file_name,const std::string& name2,const std::string&CLIENT_FILE_PATH)
     {   //file_name 请求文件 name2 打开文件
            int n=0;
            bool ts=false;
            int next_seq_expected=0;//这一次希望收到对面传过来的序列号
            int segments_in_between=0;
            int this_segment_index=0;
            if(receiver_window_==0)
            {
                receiver_window_=100;
            }

        unsigned char* buffer=(unsigned char *)calloc(MAX_PACKET_SIZE, sizeof(unsigned char));
            std::cout << "server_add::" << cline_address.sin_addr.s_addr<<std::endl;
            std::cout << "server_add_port::" << cline_address.sin_port<<std::endl;
            std::cout << "server_add_family::" << cline_address.sin_family<<std::endl;

            n=sendto(sockfd_,file_name.c_str(),file_name.size(),0,
            (struct sockaddr*)&cline_address,sizeof(struct sockaddr_in));//发送给对面需要的文件名字

            if(n<0)
            {
               std::cout<<"Failed to write to socket !!!\n";
            }

            ::memset(buffer,0,MAX_PACKET_SIZE);

            std::fstream file;
            std::string file_path=std::string(CLIENT_FILE_PATH)+name2;
            file.open(file_path.c_str(),std::ios::out);
            if(!file.is_open())
            {
                 std::cout<<"File open failed !!!\n";
                 exit(1);
            }


            while((n=recvfrom(sockfd_,buffer,MAX_PACKET_SIZE,0,nullptr,nullptr))>0)
            {
                
                            char buffer2[20];
                            ::memcpy(buffer2,buffer,20);
                                if (strstr("FILE NOT FOUND", buffer2) != NULL) {
                                std::cout<< "File not found !!!\n";
                                return;
                            }
                            

                            std::unique_ptr<DataSegment> data_segment=std::make_unique<DataSegment>();
                            data_segment->DeserializeToDataSegment(buffer,n);
                            std::cout << "packet received with seq_number_:"
              << data_segment->seq_number_<<std::endl;

                    // Random drop
                    if (is_packet_drop_ && rand() % 100 < prob_value_) {
                    std::cout << "Dropping this packet with seq "
                                << data_segment->seq_number_<<std::endl;
                    continue;
                    }

                    // Random delay
                    if (is_delay_ && rand() % 100 < prob_value_) {
                    int sleep_time = (rand() % 10) * 1000;
                    std::cout<< "Delaying this packet with seq " << data_segment->seq_number_
                                << " for " << sleep_time << "us\n";
                    usleep(sleep_time);
                    }

                    if(last_in_order_packet_==-1)//开始时 对面是0+67
                    {
                        next_seq_expected=initial_seq_number_;
                    }else{
                          next_seq_expected=data_segments_[last_in_order_packet_].seq_number_+data_segments_[last_in_order_packet_].length_;
                    }

                    if(next_seq_expected>data_segment->seq_number_&&!data_segment->fin_flag_)//对面发的包已经收到过了 需要重发
                    {
                        send_ack(next_seq_expected);
                        continue;
                    }

                    segments_in_between=(data_segment->seq_number_-next_seq_expected)/MAX_DATA_SIZE;//双方都+23 剪掉了 
                    this_segment_index=last_in_order_packet_+1+segments_in_between;//始终+1  即使是第一个包 算出来下标是0 若不是是以上一次接受到包的后一个开始，往后扩展一个窗口长度作为滑动窗口范围
                     /*
                    if(last_in_order_packet_==-1)
                    {
                     this_segment_index=0;   
                    } else {
                       this_segment_index=last_in_order_packet_+1+segments_in_between;//始终+1  即使是第一个包 算出来下标是0 若不是是以上一次接受到包的后一个开始，往后扩展一个窗口长度作为滑动窗口范围
                       //并且是跳过last_inorder_packet_
                    }
                    */

                    if(this_segment_index-last_in_order_packet_>receiver_window_)
                    {
                        std::cout<<"Packet dropped "<<this_segment_index<<std::endl;
                        continue;
                    }
                    //超过窗口最大限制 将包扔掉

                    if(data_segment->fin_flag_)//最后一个包
                    {
                        std::cout<<"Fin falg recvived !!! \n";
                        fin_flag_received_=true;
                    }
                    
                    insert(this_segment_index,*data_segment);
                        for(int i=last_in_order_packet_+1;i<=last_packet_received_;i++)//内容都依次在数组data_segments_当中 直到连续数据包确认收到才往里面写 不连续直接中断
                        {
                            if(data_segments_[i].seq_number_!=-1)
                            {
                                if(file.is_open()){
                                    file << data_segments_[i].data_;
                                    last_in_order_packet_ = i;
                                }
                        }else{
                            break;
                        }
                    }//[0,last_in_order_packet_] 一定是有内容的 

                    if(fin_flag_received_&&last_in_order_packet_==last_packet_received_)
                     break;
                    send_ack(data_segments_[last_in_order_packet_].seq_number_+data_segments_[last_in_order_packet_].length_);//放在最后进行发送请求包 确保前面情况已经解决
                    ::memset(buffer,0,MAX_PACKET_SIZE);
            }

            free(buffer);
            file.close();
     }
     
     void UdpClient::CreateConnection(const std::string& address,const std::string& port)
     {  
        struct sockaddr_in my_address;
        ::memset(&my_address,0,sizeof(my_address));
        my_address.sin_family=AF_INET;
        my_address.sin_port=htons(atoi(port.c_str()));
        my_address.sin_addr.s_addr=inet_addr(address.c_str());
        sockfd_=socket(AF_INET,SOCK_DGRAM,0);
        if(sockfd_<0)
        {
            std::cout<<"failed socket\n";
            exit(1);
        }
        this->cline_address=my_address;
     }

     void UdpClient::send_ack(int ackNumber) {
            int n = 0;
            DataSegment *ack_segment = new DataSegment();
            ack_segment->ack_flag_ = true;
            ack_segment->ack_number_ = ackNumber;
            ack_segment->fin_flag_ = false;
            ack_segment->length_ = 0;
            ack_segment->seq_number_ = 0;//为零 只需要ack即可
            std::cout<<ack_segment->ack_number_<<std::endl;
            char *data = ack_segment->SerializeToCharArray();//序列化进行发送
            n = sendto(sockfd_, data, MAX_PACKET_SIZE, 0,
                        (struct sockaddr *)&(cline_address), sizeof(struct sockaddr_in));
            if (n < 0) {
                std::cout<< "Sending ack failed !!!\n";
            }
            free(data);
}
     
         void UdpClient::insert(int index, const DataSegment &data_segment) {
          if (index > last_packet_received_) {
           for (int i = last_packet_received_ + 1; i <= index; i++) {
                 if (i == index) {
                    data_segments_.push_back(data_segment);
                 } else {
                    DataSegment data_segment;
                    data_segments_.push_back(data_segment);
                 }
              }
                    last_packet_received_ = index;//插入一个更新一个下标
             } else {
              data_segments_[index] = data_segment;
               }
         }
         /*若连续接受 则依次更新下标 如果跨段接收 0 1 2    7 中间为空的data_segmment(默认构造) 
           若不连续接受0 1 2  4    7 index<last_packet_received  将空的更新为内容数据包 */


           int UdpClient::add_to_data_segment_vector(const DataSegment &data_segment) {
               data_segments_.push_back(data_segment);
               return data_segments_.size() - 1;
}

UdpClient::~UdpClient()
{
    close(sockfd_);
}
