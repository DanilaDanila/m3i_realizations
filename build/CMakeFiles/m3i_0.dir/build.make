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
CMAKE_COMMAND = /home/krolchonok/.local/lib/python3.8/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/krolchonok/.local/lib/python3.8/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build

# Include any dependencies generated for this target.
include CMakeFiles/m3i_0.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/m3i_0.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/m3i_0.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/m3i_0.dir/flags.make

CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o: CMakeFiles/m3i_0.dir/flags.make
CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o: ../src/rels/0/m3i.cpp
CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o: CMakeFiles/m3i_0.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o -MF CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o.d -o CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o -c /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/src/rels/0/m3i.cpp

CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/src/rels/0/m3i.cpp > CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.i

CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/src/rels/0/m3i.cpp -o CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.s

# Object files for target m3i_0
m3i_0_OBJECTS = \
"CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o"

# External object files for target m3i_0
m3i_0_EXTERNAL_OBJECTS =

libm3i_0.a: CMakeFiles/m3i_0.dir/src/rels/0/m3i.cpp.o
libm3i_0.a: CMakeFiles/m3i_0.dir/build.make
libm3i_0.a: CMakeFiles/m3i_0.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libm3i_0.a"
	$(CMAKE_COMMAND) -P CMakeFiles/m3i_0.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/m3i_0.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/m3i_0.dir/build: libm3i_0.a
.PHONY : CMakeFiles/m3i_0.dir/build

CMakeFiles/m3i_0.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/m3i_0.dir/cmake_clean.cmake
.PHONY : CMakeFiles/m3i_0.dir/clean

CMakeFiles/m3i_0.dir/depend:
	cd /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build /home/krolchonok/Documents/Study/3-course/SE_algo/Measurings/m3i_realizations/build/CMakeFiles/m3i_0.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/m3i_0.dir/depend
