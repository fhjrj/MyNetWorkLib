#ifndef widdow_
#define widdow_

#include <vector>
#include "Buffer_.h"


class SlidingWindow {
 public:
  SlidingWindow();
  ~SlidingWindow();

  int AddToBuffer(const SlidWinBuffer& buffer);

  std::vector<SlidWinBuffer> sliding_window_buffers_;//记录发送过去的包
  int last_packet_sent_;//最后一次发送给对面的序列号,数组下标
  int last_acked_packet_;// // 成功发送且已经确认的数据包中最小的序列号
  int send_base_;//=last_acked_packet_+1 上一次对面发送过来的ack_number,这一次发送的目标
  int dup_ack_;
};



# endif