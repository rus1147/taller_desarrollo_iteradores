# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_SOURCE_DIR = /home/pablo/w/materias/algo2/repo/clases/labo/07_desarrollo_iteradores/ejercitacion/alumnos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pablo/w/materias/algo2/repo/clases/labo/07_desarrollo_iteradores/ejercitacion/alumnos

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/bin/ccmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components

.PHONY : list_install_components/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/pablo/w/materias/algo2/repo/clases/labo/07_desarrollo_iteradores/ejercitacion/alumnos/CMakeFiles /home/pablo/w/materias/algo2/repo/clases/labo/07_desarrollo_iteradores/ejercitacion/alumnos/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/pablo/w/materias/algo2/repo/clases/labo/07_desarrollo_iteradores/ejercitacion/alumnos/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named correrValgrind

# Build rule for target.
correrValgrind: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 correrValgrind
.PHONY : correrValgrind

# fast build rule for target.
correrValgrind/fast:
	$(MAKE) -f CMakeFiles/correrValgrind.dir/build.make CMakeFiles/correrValgrind.dir/build
.PHONY : correrValgrind/fast

#=============================================================================
# Target rules for targets named correrTests

# Build rule for target.
correrTests: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 correrTests
.PHONY : correrTests

# fast build rule for target.
correrTests/fast:
	$(MAKE) -f CMakeFiles/correrTests.dir/build.make CMakeFiles/correrTests.dir/build
.PHONY : correrTests/fast

#=============================================================================
# Target rules for targets named gtest_main

# Build rule for target.
gtest_main: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gtest_main
.PHONY : gtest_main

# fast build rule for target.
gtest_main/fast:
	$(MAKE) -f tests/google-test/CMakeFiles/gtest_main.dir/build.make tests/google-test/CMakeFiles/gtest_main.dir/build
.PHONY : gtest_main/fast

#=============================================================================
# Target rules for targets named gtest

# Build rule for target.
gtest: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 gtest
.PHONY : gtest

# fast build rule for target.
gtest/fast:
	$(MAKE) -f tests/google-test/CMakeFiles/gtest.dir/build.make tests/google-test/CMakeFiles/gtest.dir/build
.PHONY : gtest/fast

tests/tests_taxonomia.o: tests/tests_taxonomia.cpp.o

.PHONY : tests/tests_taxonomia.o

# target to build an object file
tests/tests_taxonomia.cpp.o:
	$(MAKE) -f CMakeFiles/correrTests.dir/build.make CMakeFiles/correrTests.dir/tests/tests_taxonomia.cpp.o
.PHONY : tests/tests_taxonomia.cpp.o

tests/tests_taxonomia.i: tests/tests_taxonomia.cpp.i

.PHONY : tests/tests_taxonomia.i

# target to preprocess a source file
tests/tests_taxonomia.cpp.i:
	$(MAKE) -f CMakeFiles/correrTests.dir/build.make CMakeFiles/correrTests.dir/tests/tests_taxonomia.cpp.i
.PHONY : tests/tests_taxonomia.cpp.i

tests/tests_taxonomia.s: tests/tests_taxonomia.cpp.s

.PHONY : tests/tests_taxonomia.s

# target to generate assembly for a file
tests/tests_taxonomia.cpp.s:
	$(MAKE) -f CMakeFiles/correrTests.dir/build.make CMakeFiles/correrTests.dir/tests/tests_taxonomia.cpp.s
.PHONY : tests/tests_taxonomia.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... install/strip"
	@echo "... correrValgrind"
	@echo "... rebuild_cache"
	@echo "... install/local"
	@echo "... correrTests"
	@echo "... edit_cache"
	@echo "... list_install_components"
	@echo "... install"
	@echo "... gtest_main"
	@echo "... gtest"
	@echo "... tests/tests_taxonomia.o"
	@echo "... tests/tests_taxonomia.i"
	@echo "... tests/tests_taxonomia.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

