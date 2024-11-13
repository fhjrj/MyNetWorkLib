#ifndef udp_server_
#define udp_server_
#include <netinet/in.h>
#include <unistd.h>
#include <fstream>
#include <iostream>
#include <memory>
#include <string>
#include <sys/epoll.h>
#include "data_segment.h"
#include "packet_statistics.h"
#include "sliding_window.h"


class UdpServer {
 public:
  UdpServer(int rwnd);

  ~UdpServer() {
    // if (sliding_window_) {
    //   free(sliding_window_);
    // }

    // if (packet_statistics_) {
    //   free(packet_statistics_);
    // }

    close(sockfd_);
    file_.close();
  }

  char *GetRequest(int client_sockfd);
  bool OpenFile(const std::string &file_name);
  void StartFileTransfer();
  void SendError();

  int rwnd_;
  int cwnd_;
  int ssthresh_;
  int start_byte_;
  bool is_slow_start_;
  bool is_cong_avd_;
  bool is_fast_recovery_;
  int StartServer(int port);

 private:
  std::unique_ptr<SlidingWindow> sliding_window_;//管理的滑动窗口类----> queue
  std::unique_ptr<PacketStatistics> packet_statistics_;//包的管理统计

  int sockfd_;
  std::fstream file_;
  struct sockaddr_in cli_address_;
  struct epoll_event events[5];
  int initial_seq_number_;
  int file_length_;
  double smoothed_rtt_;
  double dev_rtt_;
  double smoothed_timeout_;

  void send();

  void send_packet(int seq_number, int start_byte);
  void calculate_rtt_and_time(struct timeval start_time,
                              struct timeval end_time);
  void retransmit_segment(int index_number);
  void read_file_and_send(bool fin_flag, int start_byte, int end_byte);
  void send_data_segment(DataSegment *data_segment);
  void wait_for_ack();
};
#endif