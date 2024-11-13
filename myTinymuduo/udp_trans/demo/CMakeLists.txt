cmake_minimum_required(VERSION 3.10)
set(EXECUTABLE_OUTPUT_PATH ${outpath})

link_libraries(${lib_path})
include_directories(${trans})
link_directories(udp_server)
add_executable(clniet clinet.cpp)
target_link_libraries(clniet udp_server)


link_libraries(${lib_path})
include_directories(${trans})
link_directories(udp_server)
add_executable(server server.cpp)
target_link_libraries(server udp_server)

