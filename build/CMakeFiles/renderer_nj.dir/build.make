# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.26

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = D:\Code\Cmake\bin\cmake.exe

# The command to remove a file.
RM = D:\Code\Cmake\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\CG\renderer_nj

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\CG\renderer_nj\build

# Include any dependencies generated for this target.
include CMakeFiles/renderer_nj.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/renderer_nj.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/renderer_nj.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/renderer_nj.dir/flags.make

CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj: D:/CG/renderer_nj/src/Kulla_Conty.cpp
CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\Kulla_Conty.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\Kulla_Conty.cpp.obj -c D:\CG\renderer_nj\src\Kulla_Conty.cpp

CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\Kulla_Conty.cpp > CMakeFiles\renderer_nj.dir\src\Kulla_Conty.cpp.i

CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\Kulla_Conty.cpp -o CMakeFiles\renderer_nj.dir\src\Kulla_Conty.cpp.s

CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj: D:/CG/renderer_nj/src/SSR.cpp
CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\SSR.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\SSR.cpp.obj -c D:\CG\renderer_nj\src\SSR.cpp

CMakeFiles/renderer_nj.dir/src/SSR.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/SSR.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\SSR.cpp > CMakeFiles\renderer_nj.dir\src\SSR.cpp.i

CMakeFiles/renderer_nj.dir/src/SSR.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/SSR.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\SSR.cpp -o CMakeFiles\renderer_nj.dir\src\SSR.cpp.s

CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj: D:/CG/renderer_nj/src/brdf.cpp
CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\brdf.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\brdf.cpp.obj -c D:\CG\renderer_nj\src\brdf.cpp

CMakeFiles/renderer_nj.dir/src/brdf.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/brdf.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\brdf.cpp > CMakeFiles\renderer_nj.dir\src\brdf.cpp.i

CMakeFiles/renderer_nj.dir/src/brdf.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/brdf.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\brdf.cpp -o CMakeFiles\renderer_nj.dir\src\brdf.cpp.s

CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj: D:/CG/renderer_nj/src/cubemap.cpp
CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\cubemap.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\cubemap.cpp.obj -c D:\CG\renderer_nj\src\cubemap.cpp

CMakeFiles/renderer_nj.dir/src/cubemap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/cubemap.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\cubemap.cpp > CMakeFiles\renderer_nj.dir\src\cubemap.cpp.i

CMakeFiles/renderer_nj.dir/src/cubemap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/cubemap.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\cubemap.cpp -o CMakeFiles\renderer_nj.dir\src\cubemap.cpp.s

CMakeFiles/renderer_nj.dir/src/glad.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/glad.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/glad.cpp.obj: D:/CG/renderer_nj/src/glad.cpp
CMakeFiles/renderer_nj.dir/src/glad.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/renderer_nj.dir/src/glad.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/glad.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\glad.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\glad.cpp.obj -c D:\CG\renderer_nj\src\glad.cpp

CMakeFiles/renderer_nj.dir/src/glad.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/glad.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\glad.cpp > CMakeFiles\renderer_nj.dir\src\glad.cpp.i

CMakeFiles/renderer_nj.dir/src/glad.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/glad.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\glad.cpp -o CMakeFiles\renderer_nj.dir\src\glad.cpp.s

CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj: D:/CG/renderer_nj/src/initiate.cpp
CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\initiate.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\initiate.cpp.obj -c D:\CG\renderer_nj\src\initiate.cpp

CMakeFiles/renderer_nj.dir/src/initiate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/initiate.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\initiate.cpp > CMakeFiles\renderer_nj.dir\src\initiate.cpp.i

CMakeFiles/renderer_nj.dir/src/initiate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/initiate.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\initiate.cpp -o CMakeFiles\renderer_nj.dir\src\initiate.cpp.s

CMakeFiles/renderer_nj.dir/src/main.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/main.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/main.cpp.obj: D:/CG/renderer_nj/src/main.cpp
CMakeFiles/renderer_nj.dir/src/main.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/renderer_nj.dir/src/main.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/main.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\main.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\main.cpp.obj -c D:\CG\renderer_nj\src\main.cpp

CMakeFiles/renderer_nj.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/main.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\main.cpp > CMakeFiles\renderer_nj.dir\src\main.cpp.i

CMakeFiles/renderer_nj.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/main.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\main.cpp -o CMakeFiles\renderer_nj.dir\src\main.cpp.s

CMakeFiles/renderer_nj.dir/src/material.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/material.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/material.cpp.obj: D:/CG/renderer_nj/src/material.cpp
CMakeFiles/renderer_nj.dir/src/material.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/renderer_nj.dir/src/material.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/material.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\material.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\material.cpp.obj -c D:\CG\renderer_nj\src\material.cpp

CMakeFiles/renderer_nj.dir/src/material.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/material.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\material.cpp > CMakeFiles\renderer_nj.dir\src\material.cpp.i

CMakeFiles/renderer_nj.dir/src/material.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/material.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\material.cpp -o CMakeFiles\renderer_nj.dir\src\material.cpp.s

CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj: D:/CG/renderer_nj/src/mesh.cpp
CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\mesh.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\mesh.cpp.obj -c D:\CG\renderer_nj\src\mesh.cpp

CMakeFiles/renderer_nj.dir/src/mesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/mesh.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\mesh.cpp > CMakeFiles\renderer_nj.dir\src\mesh.cpp.i

CMakeFiles/renderer_nj.dir/src/mesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/mesh.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\mesh.cpp -o CMakeFiles\renderer_nj.dir\src\mesh.cpp.s

CMakeFiles/renderer_nj.dir/src/model.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/model.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/model.cpp.obj: D:/CG/renderer_nj/src/model.cpp
CMakeFiles/renderer_nj.dir/src/model.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/renderer_nj.dir/src/model.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/model.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\model.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\model.cpp.obj -c D:\CG\renderer_nj\src\model.cpp

CMakeFiles/renderer_nj.dir/src/model.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/model.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\model.cpp > CMakeFiles\renderer_nj.dir\src\model.cpp.i

CMakeFiles/renderer_nj.dir/src/model.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/model.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\model.cpp -o CMakeFiles\renderer_nj.dir\src\model.cpp.s

CMakeFiles/renderer_nj.dir/src/object.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/object.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/object.cpp.obj: D:/CG/renderer_nj/src/object.cpp
CMakeFiles/renderer_nj.dir/src/object.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/renderer_nj.dir/src/object.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/object.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\object.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\object.cpp.obj -c D:\CG\renderer_nj\src\object.cpp

CMakeFiles/renderer_nj.dir/src/object.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/object.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\object.cpp > CMakeFiles\renderer_nj.dir\src\object.cpp.i

CMakeFiles/renderer_nj.dir/src/object.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/object.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\object.cpp -o CMakeFiles\renderer_nj.dir\src\object.cpp.s

CMakeFiles/renderer_nj.dir/src/screen.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/screen.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/screen.cpp.obj: D:/CG/renderer_nj/src/screen.cpp
CMakeFiles/renderer_nj.dir/src/screen.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/renderer_nj.dir/src/screen.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/screen.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\screen.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\screen.cpp.obj -c D:\CG\renderer_nj\src\screen.cpp

CMakeFiles/renderer_nj.dir/src/screen.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/screen.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\screen.cpp > CMakeFiles\renderer_nj.dir\src\screen.cpp.i

CMakeFiles/renderer_nj.dir/src/screen.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/screen.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\screen.cpp -o CMakeFiles\renderer_nj.dir\src\screen.cpp.s

CMakeFiles/renderer_nj.dir/src/shader.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/shader.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/shader.cpp.obj: D:/CG/renderer_nj/src/shader.cpp
CMakeFiles/renderer_nj.dir/src/shader.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/renderer_nj.dir/src/shader.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/shader.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\shader.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\shader.cpp.obj -c D:\CG\renderer_nj\src\shader.cpp

CMakeFiles/renderer_nj.dir/src/shader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/shader.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\shader.cpp > CMakeFiles\renderer_nj.dir\src\shader.cpp.i

CMakeFiles/renderer_nj.dir/src/shader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/shader.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\shader.cpp -o CMakeFiles\renderer_nj.dir\src\shader.cpp.s

CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj: D:/CG/renderer_nj/src/shadow.cpp
CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\shadow.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\shadow.cpp.obj -c D:\CG\renderer_nj\src\shadow.cpp

CMakeFiles/renderer_nj.dir/src/shadow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/shadow.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\shadow.cpp > CMakeFiles\renderer_nj.dir\src\shadow.cpp.i

CMakeFiles/renderer_nj.dir/src/shadow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/shadow.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\shadow.cpp -o CMakeFiles\renderer_nj.dir\src\shadow.cpp.s

CMakeFiles/renderer_nj.dir/src/texture.cpp.obj: CMakeFiles/renderer_nj.dir/flags.make
CMakeFiles/renderer_nj.dir/src/texture.cpp.obj: CMakeFiles/renderer_nj.dir/includes_CXX.rsp
CMakeFiles/renderer_nj.dir/src/texture.cpp.obj: D:/CG/renderer_nj/src/texture.cpp
CMakeFiles/renderer_nj.dir/src/texture.cpp.obj: CMakeFiles/renderer_nj.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/renderer_nj.dir/src/texture.cpp.obj"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/renderer_nj.dir/src/texture.cpp.obj -MF CMakeFiles\renderer_nj.dir\src\texture.cpp.obj.d -o CMakeFiles\renderer_nj.dir\src\texture.cpp.obj -c D:\CG\renderer_nj\src\texture.cpp

CMakeFiles/renderer_nj.dir/src/texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/renderer_nj.dir/src/texture.cpp.i"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\CG\renderer_nj\src\texture.cpp > CMakeFiles\renderer_nj.dir\src\texture.cpp.i

CMakeFiles/renderer_nj.dir/src/texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/renderer_nj.dir/src/texture.cpp.s"
	D:\Code\mingw64\bin\g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\CG\renderer_nj\src\texture.cpp -o CMakeFiles\renderer_nj.dir\src\texture.cpp.s

# Object files for target renderer_nj
renderer_nj_OBJECTS = \
"CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/glad.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/main.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/material.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/model.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/object.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/screen.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/shader.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj" \
"CMakeFiles/renderer_nj.dir/src/texture.cpp.obj"

# External object files for target renderer_nj
renderer_nj_EXTERNAL_OBJECTS =

D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/Kulla_Conty.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/SSR.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/brdf.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/cubemap.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/glad.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/initiate.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/main.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/material.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/mesh.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/model.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/object.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/screen.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/shader.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/shadow.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/src/texture.cpp.obj
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/build.make
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/linkLibs.rsp
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/objects1.rsp
D:/CG/renderer_nj/bin/renderer_nj.exe: CMakeFiles/renderer_nj.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=D:\CG\renderer_nj\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX executable D:\CG\renderer_nj\bin\renderer_nj.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\renderer_nj.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/renderer_nj.dir/build: D:/CG/renderer_nj/bin/renderer_nj.exe
.PHONY : CMakeFiles/renderer_nj.dir/build

CMakeFiles/renderer_nj.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\renderer_nj.dir\cmake_clean.cmake
.PHONY : CMakeFiles/renderer_nj.dir/clean

CMakeFiles/renderer_nj.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\CG\renderer_nj D:\CG\renderer_nj D:\CG\renderer_nj\build D:\CG\renderer_nj\build D:\CG\renderer_nj\build\CMakeFiles\renderer_nj.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/renderer_nj.dir/depend

