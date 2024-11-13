cmake_minimum_required(VERSION 3.10)
project(safe_udp)
set(LIBRARY_OUTPUT_PATH ${lib_path})
aux_source_directory(${PROJECT_SOURCE_DIR} udp)
add_library(udp_server STATIC ${udp})


