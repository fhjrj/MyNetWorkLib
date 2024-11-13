# MyTinyMuduo
## 1.本项目是学习muduo库的实现，并对其进行去BOOST库依靠。
## 2.实现并重构了muduo库的异步日志模块，HTTP分析模块和主要的网络框架模块(在resoure文件，增加了TimeQueue的实现)，未实现的部分包括muduo库的TimeZone模块。
### 文件结构如下

### ├── base 此部分是实现的muduo异步日志
### ├── build
### ├── CMakeLists.txt
### ├── Http 此部分是实现的http模块
### ├── lib 此部分是日志模块，http模块，muduo核心模块的静态库文件
### ├── out 此部分是测试文件，muduo核心模块(resoure中)的测试是一个简单的回声服务器，其他模块测试代码都在对应文件中
### ├── resoure 此部分muduo核心网络模块
### |—— udp_tras 此部分是safe-udp传输模块。传送超大文本 支持丢包和延迟模拟
### └── text.cpp 网络模块的回声服务器

