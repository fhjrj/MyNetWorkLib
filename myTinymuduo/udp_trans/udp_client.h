#ifndef UDP_SERVER_
#define UDP_SERVER

#include <netinet/in.h>
#include <string.h>
#include <sys/types.h>
#include <string>
#include <vector>
#include <sys/socket.h>
#include "data_segment.h"

    
  // char CLIENT_FILE_PATH[]="/home/user/MyTinyMuduo/myTinymuduo/udp_trans/text";
    
    class UdpClient
    {
     public:
       UdpClient(bool a,bool b);
       ~UdpClient();
       void SendFileRequest(const std::string& file_name,const std::string& name2,const std::string& name3);
       void CreateConnection(const std::string& address,const std::string& port);

       int initial_seq_number_;
       bool is_packet_drop_;
       bool is_delay_;
       int prob_value_;

       int last_in_order_packet_;
       int last_packet_received_;
       int receiver_window_;
       bool fin_flag_received_;

     private:
     void send_ack(int acknumber);
     void insert(int index,const DataSegment& datasegment);

     std::vector<DataSegment> data_segments_;
     struct sockaddr_in cline_address;
     int sockfd_;
     int ack_number_;
     int seg_number_;
     int16_t length;
     int add_to_data_segment_vector(const DataSegment &data_segment);
    };


#endif