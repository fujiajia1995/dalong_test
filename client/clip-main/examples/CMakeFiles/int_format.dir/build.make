# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.23.1_1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.23.1_1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/jiajunfu/clip-main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/jiajunfu/clip-main

# Include any dependencies generated for this target.
include examples/CMakeFiles/int_format.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/CMakeFiles/int_format.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/int_format.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/int_format.dir/flags.make

examples/CMakeFiles/int_format.dir/int_format.cpp.o: examples/CMakeFiles/int_format.dir/flags.make
examples/CMakeFiles/int_format.dir/int_format.cpp.o: examples/int_format.cpp
examples/CMakeFiles/int_format.dir/int_format.cpp.o: examples/CMakeFiles/int_format.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/jiajunfu/clip-main/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/CMakeFiles/int_format.dir/int_format.cpp.o"
	cd /Users/jiajunfu/clip-main/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/CMakeFiles/int_format.dir/int_format.cpp.o -MF CMakeFiles/int_format.dir/int_format.cpp.o.d -o CMakeFiles/int_format.dir/int_format.cpp.o -c /Users/jiajunfu/clip-main/examples/int_format.cpp

examples/CMakeFiles/int_format.dir/int_format.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/int_format.dir/int_format.cpp.i"
	cd /Users/jiajunfu/clip-main/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/jiajunfu/clip-main/examples/int_format.cpp > CMakeFiles/int_format.dir/int_format.cpp.i

examples/CMakeFiles/int_format.dir/int_format.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/int_format.dir/int_format.cpp.s"
	cd /Users/jiajunfu/clip-main/examples && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/jiajunfu/clip-main/examples/int_format.cpp -o CMakeFiles/int_format.dir/int_format.cpp.s

# Object files for target int_format
int_format_OBJECTS = \
"CMakeFiles/int_format.dir/int_format.cpp.o"

# External object files for target int_format
int_format_EXTERNAL_OBJECTS =

examples/int_format: examples/CMakeFiles/int_format.dir/int_format.cpp.o
examples/int_format: examples/CMakeFiles/int_format.dir/build.make
examples/int_format: libclip.a
examples/int_format: examples/CMakeFiles/int_format.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/jiajunfu/clip-main/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable int_format"
	cd /Users/jiajunfu/clip-main/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/int_format.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/int_format.dir/build: examples/int_format
.PHONY : examples/CMakeFiles/int_format.dir/build

examples/CMakeFiles/int_format.dir/clean:
	cd /Users/jiajunfu/clip-main/examples && $(CMAKE_COMMAND) -P CMakeFiles/int_format.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/int_format.dir/clean

examples/CMakeFiles/int_format.dir/depend:
	cd /Users/jiajunfu/clip-main && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/jiajunfu/clip-main /Users/jiajunfu/clip-main/examples /Users/jiajunfu/clip-main /Users/jiajunfu/clip-main/examples /Users/jiajunfu/clip-main/examples/CMakeFiles/int_format.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/int_format.dir/depend

