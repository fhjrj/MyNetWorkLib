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
include base/CMakeFiles/log.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include base/CMakeFiles/log.dir/compiler_depend.make

# Include the progress variables for this target.
include base/CMakeFiles/log.dir/progress.make

# Include the compile flags for this target's objects.
include base/CMakeFiles/log.dir/flags.make

base/CMakeFiles/log.dir/Aslogging.cpp.o: base/CMakeFiles/log.dir/flags.make
base/CMakeFiles/log.dir/Aslogging.cpp.o: ../base/Aslogging.cpp
base/CMakeFiles/log.dir/Aslogging.cpp.o: base/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object base/CMakeFiles/log.dir/Aslogging.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT base/CMakeFiles/log.dir/Aslogging.cpp.o -MF CMakeFiles/log.dir/Aslogging.cpp.o.d -o CMakeFiles/log.dir/Aslogging.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/base/Aslogging.cpp

base/CMakeFiles/log.dir/Aslogging.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/Aslogging.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/base/Aslogging.cpp > CMakeFiles/log.dir/Aslogging.cpp.i

base/CMakeFiles/log.dir/Aslogging.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/Aslogging.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/base/Aslogging.cpp -o CMakeFiles/log.dir/Aslogging.cpp.s

base/CMakeFiles/log.dir/FileUtil.cpp.o: base/CMakeFiles/log.dir/flags.make
base/CMakeFiles/log.dir/FileUtil.cpp.o: ../base/FileUtil.cpp
base/CMakeFiles/log.dir/FileUtil.cpp.o: base/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object base/CMakeFiles/log.dir/FileUtil.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT base/CMakeFiles/log.dir/FileUtil.cpp.o -MF CMakeFiles/log.dir/FileUtil.cpp.o.d -o CMakeFiles/log.dir/FileUtil.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/base/FileUtil.cpp

base/CMakeFiles/log.dir/FileUtil.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/FileUtil.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/base/FileUtil.cpp > CMakeFiles/log.dir/FileUtil.cpp.i

base/CMakeFiles/log.dir/FileUtil.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/FileUtil.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/base/FileUtil.cpp -o CMakeFiles/log.dir/FileUtil.cpp.s

base/CMakeFiles/log.dir/LogFile.cpp.o: base/CMakeFiles/log.dir/flags.make
base/CMakeFiles/log.dir/LogFile.cpp.o: ../base/LogFile.cpp
base/CMakeFiles/log.dir/LogFile.cpp.o: base/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object base/CMakeFiles/log.dir/LogFile.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT base/CMakeFiles/log.dir/LogFile.cpp.o -MF CMakeFiles/log.dir/LogFile.cpp.o.d -o CMakeFiles/log.dir/LogFile.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/base/LogFile.cpp

base/CMakeFiles/log.dir/LogFile.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/LogFile.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/base/LogFile.cpp > CMakeFiles/log.dir/LogFile.cpp.i

base/CMakeFiles/log.dir/LogFile.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/LogFile.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/base/LogFile.cpp -o CMakeFiles/log.dir/LogFile.cpp.s

base/CMakeFiles/log.dir/LogStream.cpp.o: base/CMakeFiles/log.dir/flags.make
base/CMakeFiles/log.dir/LogStream.cpp.o: ../base/LogStream.cpp
base/CMakeFiles/log.dir/LogStream.cpp.o: base/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object base/CMakeFiles/log.dir/LogStream.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT base/CMakeFiles/log.dir/LogStream.cpp.o -MF CMakeFiles/log.dir/LogStream.cpp.o.d -o CMakeFiles/log.dir/LogStream.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/base/LogStream.cpp

base/CMakeFiles/log.dir/LogStream.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/LogStream.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/base/LogStream.cpp > CMakeFiles/log.dir/LogStream.cpp.i

base/CMakeFiles/log.dir/LogStream.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/LogStream.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/base/LogStream.cpp -o CMakeFiles/log.dir/LogStream.cpp.s

base/CMakeFiles/log.dir/Logging.cpp.o: base/CMakeFiles/log.dir/flags.make
base/CMakeFiles/log.dir/Logging.cpp.o: ../base/Logging.cpp
base/CMakeFiles/log.dir/Logging.cpp.o: base/CMakeFiles/log.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object base/CMakeFiles/log.dir/Logging.cpp.o"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT base/CMakeFiles/log.dir/Logging.cpp.o -MF CMakeFiles/log.dir/Logging.cpp.o.d -o CMakeFiles/log.dir/Logging.cpp.o -c /home/user/MyTinyMuduo/myTinymuduo/base/Logging.cpp

base/CMakeFiles/log.dir/Logging.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/log.dir/Logging.cpp.i"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/user/MyTinyMuduo/myTinymuduo/base/Logging.cpp > CMakeFiles/log.dir/Logging.cpp.i

base/CMakeFiles/log.dir/Logging.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/log.dir/Logging.cpp.s"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/user/MyTinyMuduo/myTinymuduo/base/Logging.cpp -o CMakeFiles/log.dir/Logging.cpp.s

# Object files for target log
log_OBJECTS = \
"CMakeFiles/log.dir/Aslogging.cpp.o" \
"CMakeFiles/log.dir/FileUtil.cpp.o" \
"CMakeFiles/log.dir/LogFile.cpp.o" \
"CMakeFiles/log.dir/LogStream.cpp.o" \
"CMakeFiles/log.dir/Logging.cpp.o"

# External object files for target log
log_EXTERNAL_OBJECTS =

../lib/liblog.a: base/CMakeFiles/log.dir/Aslogging.cpp.o
../lib/liblog.a: base/CMakeFiles/log.dir/FileUtil.cpp.o
../lib/liblog.a: base/CMakeFiles/log.dir/LogFile.cpp.o
../lib/liblog.a: base/CMakeFiles/log.dir/LogStream.cpp.o
../lib/liblog.a: base/CMakeFiles/log.dir/Logging.cpp.o
../lib/liblog.a: base/CMakeFiles/log.dir/build.make
../lib/liblog.a: base/CMakeFiles/log.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/user/MyTinyMuduo/myTinymuduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library ../../lib/liblog.a"
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && $(CMAKE_COMMAND) -P CMakeFiles/log.dir/cmake_clean_target.cmake
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/log.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
base/CMakeFiles/log.dir/build: ../lib/liblog.a
.PHONY : base/CMakeFiles/log.dir/build

base/CMakeFiles/log.dir/clean:
	cd /home/user/MyTinyMuduo/myTinymuduo/build/base && $(CMAKE_COMMAND) -P CMakeFiles/log.dir/cmake_clean.cmake
.PHONY : base/CMakeFiles/log.dir/clean

base/CMakeFiles/log.dir/depend:
	cd /home/user/MyTinyMuduo/myTinymuduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/user/MyTinyMuduo/myTinymuduo /home/user/MyTinyMuduo/myTinymuduo/base /home/user/MyTinyMuduo/myTinymuduo/build /home/user/MyTinyMuduo/myTinymuduo/build/base /home/user/MyTinyMuduo/myTinymuduo/build/base/CMakeFiles/log.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : base/CMakeFiles/log.dir/depend

