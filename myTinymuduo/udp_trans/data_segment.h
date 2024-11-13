#ifndef DATA_SEGMENT
#define DATA_SEGMENT

#include <cstdlib>
#include <cstdint>


/*1500-20-8=1472
 ip:20
 udp:8
*/
constexpr int MAX_PACKET_SIZE=1472;
constexpr int MAX_DATA_SIZE=1460;
constexpr int HEADER_LENGTH=12;

//用于序列化和反序列化
class DataSegment
{
 public:
 DataSegment();
 ~DataSegment()
 {
    if(final_packet_!=nullptr)
    {
        free(final_packet_);
    }
 }

char* SerializeToCharArray();//后
void DeserializeToDataSegment(unsigned char* data_segment,int length);//先
 int ack_number_;
 int seq_number_;
 bool ack_flag_;
 bool fin_flag_;
 uint16_t length_;
 char* data_=nullptr;

 private:
 uint32_t convert_to_uint32(unsigned char* buffer,int start_index);
 bool convert_to_bool(unsigned char* buffer,int index);
 uint16_t convert_to_uint16(unsigned char* buffer,int start_index);

 char* final_packet_=nullptr;

};


#endif
