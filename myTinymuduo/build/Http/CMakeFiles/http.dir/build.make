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
include Http/CMakeFiles/http.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Http/CMakeFiles/http.dir/compiler_depend.make

# Include the progress variables for this target.
include Http/CMakeFiles/http.dir/progress.make

# Include the compile flags for this target's objects.
include Http/CMakeFiles/http.dir/flags.make

Http/CMakeFiles/http.dir/HttpResponse.cpp.o: Http/CMakeFiles/http.dir/flags.make
Http/CMakeFiles/http.dir/HttpResponse.cpp.o: ../Http/HttpResponse.cpp
Http/CMakeFiles/http.dir/HttpResponse.cpp.o: Http/CMakeFiles/http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Http/CMakeFiles/http.dir/HttpResponse.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Http/CMakeFiles/http.dir/HttpResponse.cpp.o -MF CMakeFiles/http.dir/HttpResponse.cpp.o.d -o CMakeFiles/http.dir/HttpResponse.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/Http/HttpResponse.cpp

Http/CMakeFiles/http.dir/HttpResponse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/http.dir/HttpResponse.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/Http/HttpResponse.cpp > CMakeFiles/http.dir/HttpResponse.cpp.i

Http/CMakeFiles/http.dir/HttpResponse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/http.dir/HttpResponse.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/Http/HttpResponse.cpp -o CMakeFiles/http.dir/HttpResponse.cpp.s

Http/CMakeFiles/http.dir/HttpServer.cpp.o: Http/CMakeFiles/http.dir/flags.make
Http/CMakeFiles/http.dir/HttpServer.cpp.o: ../Http/HttpServer.cpp
Http/CMakeFiles/http.dir/HttpServer.cpp.o: Http/CMakeFiles/http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Http/CMakeFiles/http.dir/HttpServer.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Http/CMakeFiles/http.dir/HttpServer.cpp.o -MF CMakeFiles/http.dir/HttpServer.cpp.o.d -o CMakeFiles/http.dir/HttpServer.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/Http/HttpServer.cpp

Http/CMakeFiles/http.dir/HttpServer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/http.dir/HttpServer.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/Http/HttpServer.cpp > CMakeFiles/http.dir/HttpServer.cpp.i

Http/CMakeFiles/http.dir/HttpServer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/http.dir/HttpServer.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/Http/HttpServer.cpp -o CMakeFiles/http.dir/HttpServer.cpp.s

Http/CMakeFiles/http.dir/Http_analyse.cpp.o: Http/CMakeFiles/http.dir/flags.make
Http/CMakeFiles/http.dir/Http_analyse.cpp.o: ../Http/Http_analyse.cpp
Http/CMakeFiles/http.dir/Http_analyse.cpp.o: Http/CMakeFiles/http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object Http/CMakeFiles/http.dir/Http_analyse.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Http/CMakeFiles/http.dir/Http_analyse.cpp.o -MF CMakeFiles/http.dir/Http_analyse.cpp.o.d -o CMakeFiles/http.dir/Http_analyse.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/Http/Http_analyse.cpp

Http/CMakeFiles/http.dir/Http_analyse.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/http.dir/Http_analyse.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/Http/Http_analyse.cpp > CMakeFiles/http.dir/Http_analyse.cpp.i

Http/CMakeFiles/http.dir/Http_analyse.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/http.dir/Http_analyse.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/Http/Http_analyse.cpp -o CMakeFiles/http.dir/Http_analyse.cpp.s

Http/CMakeFiles/http.dir/httptext.cpp.o: Http/CMakeFiles/http.dir/flags.make
Http/CMakeFiles/http.dir/httptext.cpp.o: ../Http/httptext.cpp
Http/CMakeFiles/http.dir/httptext.cpp.o: Http/CMakeFiles/http.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object Http/CMakeFiles/http.dir/httptext.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Http/CMakeFiles/http.dir/httptext.cpp.o -MF CMakeFiles/http.dir/httptext.cpp.o.d -o CMakeFiles/http.dir/httptext.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/Http/httptext.cpp

Http/CMakeFiles/http.dir/httptext.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/http.dir/httptext.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/Http/httptext.cpp > CMakeFiles/http.dir/httptext.cpp.i

Http/CMakeFiles/http.dir/httptext.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/http.dir/httptext.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/Http/httptext.cpp -o CMakeFiles/http.dir/httptext.cpp.s

# Object files for target http
http_OBJECTS = \
"CMakeFiles/http.dir/HttpResponse.cpp.o" \
"CMakeFiles/http.dir/HttpServer.cpp.o" \
"CMakeFiles/http.dir/Http_analyse.cpp.o" \
"CMakeFiles/http.dir/httptext.cpp.o"

# External object files for target http
http_EXTERNAL_OBJECTS =

../lib/libhttp.a: Http/CMakeFiles/http.dir/HttpResponse.cpp.o
../lib/libhttp.a: Http/CMakeFiles/http.dir/HttpServer.cpp.o
../lib/libhttp.a: Http/CMakeFiles/http.dir/Http_analyse.cpp.o
../lib/libhttp.a: Http/CMakeFiles/http.dir/httptext.cpp.o
../lib/libhttp.a: Http/CMakeFiles/http.dir/build.make
../lib/libhttp.a: Http/CMakeFiles/http.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library ../../lib/libhttp.a"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && $(CMAKE_COMMAND) -P CMakeFiles/http.dir/cmake_clean_target.cmake
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/http.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Http/CMakeFiles/http.dir/build: ../lib/libhttp.a
.PHONY : Http/CMakeFiles/http.dir/build

Http/CMakeFiles/http.dir/clean:
	cd /home/user/MyTinyMuduo/myTinymuduo/build/Http && $(CMAKE_COMMAND) -P CMakeFiles/http.dir/cmake_clean.cmake
.PHONY : Http/CMakeFiles/http.dir/clean

Http/CMakeFiles/http.dir/depend:
	cd /home/user/MyTinyMuduo/myTinymuduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/MyTinyMuduo/myTinymuduo /home/user/MyTinyMuduo/myTinymuduo/Http /home/user/MyTinyMuduo/myTinymuduo/build /home/user/MyTinyMuduo/myTinymuduo/build/Http /home/user/MyTinyMuduo/myTinymuduo/build/Http/CMakeFiles/http.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Http/CMakeFiles/http.dir/depend

