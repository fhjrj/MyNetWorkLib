# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/user/MyTinyMuduo/myTinymuduo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/user/MyTinyMuduo/myTinymuduo/build

# Include any dependencies generated for this target.
include udp_trans/demo/CMakeFiles/clniet.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include udp_trans/demo/CMakeFiles/clniet.dir/compiler_depend.make

# Include the progress variables for this target.
include udp_trans/demo/CMakeFiles/clniet.dir/progress.make

# Include the compile flags for this target's objects.
include udp_trans/demo/CMakeFiles/clniet.dir/flags.make

udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o: udp_trans/demo/CMakeFiles/clniet.dir/flags.make
udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o: ../udp_trans/demo/clinet.cpp
udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o: udp_trans/demo/CMakeFiles/clniet.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o -MF CMakeFiles/clniet.dir/clinet.cpp.o.d -o CMakeFiles/clniet.dir/clinet.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/udp_trans/demo/clinet.cpp

udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clniet.dir/clinet.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/udp_trans/demo/clinet.cpp > CMakeFiles/clniet.dir/clinet.cpp.i

udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clniet.dir/clinet.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/udp_trans/demo/clinet.cpp -o CMakeFiles/clniet.dir/clinet.cpp.s

# Object files for target clniet
clniet_OBJECTS = \
"CMakeFiles/clniet.dir/clinet.cpp.o"

# External object files for target clniet
clniet_EXTERNAL_OBJECTS =

../out/clniet: udp_trans/demo/CMakeFiles/clniet.dir/clinet.cpp.o
../out/clniet: udp_trans/demo/CMakeFiles/clniet.dir/build.make
../out/clniet: ../lib/libudp_server.a
../out/clniet: udp_trans/demo/CMakeFiles/clniet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../out/clniet"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clniet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
udp_trans/demo/CMakeFiles/clniet.dir/build: ../out/clniet
.PHONY : udp_trans/demo/CMakeFiles/clniet.dir/build

udp_trans/demo/CMakeFiles/clniet.dir/clean:
	cd /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo && $(CMAKE_COMMAND) -P CMakeFiles/clniet.dir/cmake_clean.cmake
.PHONY : udp_trans/demo/CMakeFiles/clniet.dir/clean

udp_trans/demo/CMakeFiles/clniet.dir/depend:
	cd /home/user/MyTinyMuduo/myTinymuduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/MyTinyMuduo/myTinymuduo /home/user/MyTinyMuduo/myTinymuduo/udp_trans/demo /home/user/MyTinyMuduo/myTinymuduo/build /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo /home/user/MyTinyMuduo/myTinymuduo/build/udp_trans/demo/CMakeFiles/clniet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : udp_trans/demo/CMakeFiles/clniet.dir/depend

