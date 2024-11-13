#include <netdb.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <iostream>
#include <chrono>
#include <unistd.h>
#include "udp_client.h"



int main(int argc, char *argv[]) {


  UdpClient *udp_client = new UdpClient(false,false);
  std::string server_ip="127.0.0.1";
  std::string port_num="8100";
  std::string file_name="1.txt";
  udp_client->receiver_window_=100;
  udp_client->prob_value_ = 50;

  udp_client->CreateConnection(server_ip, port_num);
  udp_client->SendFileRequest(file_name,"2.txt","/home/user/MyTinyMuduo/myTinymuduo/udp_trans/text/");
  free(udp_client);
  return 0;
}