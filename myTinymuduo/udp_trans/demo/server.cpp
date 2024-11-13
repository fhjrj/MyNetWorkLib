#include <cstdlib>
#include <iostream>
#include <string>


#include "udp_server.h"



int main(int argc, char *argv[]) {

  int sfd = 0;
  int port_num =8100;
  int recv_window = 100;
  char *message_recv;

 UdpServer *udp_server = new UdpServer(recv_window);
  sfd = udp_server->StartServer(port_num);
  message_recv = udp_server->GetRequest(sfd);//接受的是文件
  std::string file_name =
      std::string("/home/user/MyTinyMuduo/myTinymuduo/udp_trans/text/") + std::string(message_recv);
  if (udp_server->OpenFile(file_name)) {
    udp_server->StartFileTransfer();
  } 
  else {
    udp_server->SendError();
  }
  free(udp_server);
  return 0;
}