# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pi/Desktop/w9s1_ros_tutorial/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pi/Desktop/w9s1_ros_tutorial/build

# Include any dependencies generated for this target.
include turtlesim/CMakeFiles/mimic.dir/depend.make

# Include the progress variables for this target.
include turtlesim/CMakeFiles/mimic.dir/progress.make

# Include the compile flags for this target's objects.
include turtlesim/CMakeFiles/mimic.dir/flags.make

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o: turtlesim/CMakeFiles/mimic.dir/flags.make
turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o: /home/pi/Desktop/w9s1_ros_tutorial/src/turtlesim/tutorials/mimic.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/pi/Desktop/w9s1_ros_tutorial/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o"
	cd /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mimic.dir/tutorials/mimic.cpp.o -c /home/pi/Desktop/w9s1_ros_tutorial/src/turtlesim/tutorials/mimic.cpp

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mimic.dir/tutorials/mimic.cpp.i"
	cd /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/pi/Desktop/w9s1_ros_tutorial/src/turtlesim/tutorials/mimic.cpp > CMakeFiles/mimic.dir/tutorials/mimic.cpp.i

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mimic.dir/tutorials/mimic.cpp.s"
	cd /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/pi/Desktop/w9s1_ros_tutorial/src/turtlesim/tutorials/mimic.cpp -o CMakeFiles/mimic.dir/tutorials/mimic.cpp.s

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.requires:

.PHONY : turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.requires

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.provides: turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.requires
	$(MAKE) -f turtlesim/CMakeFiles/mimic.dir/build.make turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.provides.build
.PHONY : turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.provides

turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.provides.build: turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o


# Object files for target mimic
mimic_OBJECTS = \
"CMakeFiles/mimic.dir/tutorials/mimic.cpp.o"

# External object files for target mimic
mimic_EXTERNAL_OBJECTS =

/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: turtlesim/CMakeFiles/mimic.dir/build.make
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/libroscpp.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_signals.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/librosconsole.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/libroslib.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/librospack.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libtinyxml.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/librostime.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /opt/ros/kinetic/lib/libcpp_common.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so
/home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic: turtlesim/CMakeFiles/mimic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/pi/Desktop/w9s1_ros_tutorial/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic"
	cd /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mimic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
turtlesim/CMakeFiles/mimic.dir/build: /home/pi/Desktop/w9s1_ros_tutorial/devel/lib/turtlesim/mimic

.PHONY : turtlesim/CMakeFiles/mimic.dir/build

turtlesim/CMakeFiles/mimic.dir/requires: turtlesim/CMakeFiles/mimic.dir/tutorials/mimic.cpp.o.requires

.PHONY : turtlesim/CMakeFiles/mimic.dir/requires

turtlesim/CMakeFiles/mimic.dir/clean:
	cd /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim && $(CMAKE_COMMAND) -P CMakeFiles/mimic.dir/cmake_clean.cmake
.PHONY : turtlesim/CMakeFiles/mimic.dir/clean

turtlesim/CMakeFiles/mimic.dir/depend:
	cd /home/pi/Desktop/w9s1_ros_tutorial/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pi/Desktop/w9s1_ros_tutorial/src /home/pi/Desktop/w9s1_ros_tutorial/src/turtlesim /home/pi/Desktop/w9s1_ros_tutorial/build /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim /home/pi/Desktop/w9s1_ros_tutorial/build/turtlesim/CMakeFiles/mimic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : turtlesim/CMakeFiles/mimic.dir/depend

