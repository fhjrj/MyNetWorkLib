#include "HttpResponse.h"
#include "Buffer.h"
#include <string.h>

void HttpRespne::appendToBuffer(Buffer* output) const{
    char buf[32];
  snprintf(buf, sizeof buf, "HTTP/1.1 %d ", statusCode_);
  output->append(buf,strlen(buf));
  output->append(statusMessgae_.c_str(),statusMessgae_.size());
  output->append("\r\n",2);//头部情况组合
   if (closeConnection_)
  {
    char buff[]="Connection: close\r\n";
    output->append(buff,strlen(buff));
  }
  else
  {
    ::memset(buf,0,sizeof(buf));
    snprintf(buf, sizeof buf, "Content-Length: %zd\r\n", body_.size());//回复报文的消息体长度
    output->append(buf,strlen(buf));
    char buff[]="Connection: Keep-Alive\r\n";
    output->append("Connection: Keep-Alive\r\n",strlen(buff));
  }

 for (const auto& header : headers_)//组装其他信息
  {
    output->append(header.first.c_str(),header.first.size());
    output->append(": ",2);
    output->append(header.second.c_str(),header.second.size());
    output->append("\r\n",2);
  }

  output->append("\r\n",2);
  output->append(body_.c_str(),body_.size());//消息体内容，消息体最后+\n,不用+\r\n
}
