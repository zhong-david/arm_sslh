# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/dzhong/School/eecs588/The-Spectre-Menace

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/dzhong/School/eecs588/The-Spectre-Menace/build

# Utility rule file for install-arm_sslh-stripped.

# Include any custom commands dependencies for this target.
include arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/compiler_depend.make

# Include the progress variables for this target.
include arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/progress.make

arm_sslh/CMakeFiles/install-arm_sslh-stripped:
	cd /Users/dzhong/School/eecs588/The-Spectre-Menace/build/arm_sslh && /opt/homebrew/Cellar/cmake/3.28.1/bin/cmake -DCMAKE_INSTALL_COMPONENT="arm_sslh" -DCMAKE_INSTALL_DO_STRIP=1 -P /Users/dzhong/School/eecs588/The-Spectre-Menace/build/cmake_install.cmake

install-arm_sslh-stripped: arm_sslh/CMakeFiles/install-arm_sslh-stripped
install-arm_sslh-stripped: arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/build.make
.PHONY : install-arm_sslh-stripped

# Rule to build all files generated by this target.
arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/build: install-arm_sslh-stripped
.PHONY : arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/build

arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/clean:
	cd /Users/dzhong/School/eecs588/The-Spectre-Menace/build/arm_sslh && $(CMAKE_COMMAND) -P CMakeFiles/install-arm_sslh-stripped.dir/cmake_clean.cmake
.PHONY : arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/clean

arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/depend:
	cd /Users/dzhong/School/eecs588/The-Spectre-Menace/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/dzhong/School/eecs588/The-Spectre-Menace /Users/dzhong/School/eecs588/The-Spectre-Menace/arm_sslh /Users/dzhong/School/eecs588/The-Spectre-Menace/build /Users/dzhong/School/eecs588/The-Spectre-Menace/build/arm_sslh /Users/dzhong/School/eecs588/The-Spectre-Menace/build/arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : arm_sslh/CMakeFiles/install-arm_sslh-stripped.dir/depend

