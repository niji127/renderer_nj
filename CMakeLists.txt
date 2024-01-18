cmake_minimum_required(VERSION 3.26) # 版本号

project(renderer_nj LANGUAGES CXX) # 项目名

set(CMAKE_CXX_FLAGS "-lstdc++fs -std=c++17")

include_directories("${PROJECT_SOURCE_DIR}/include") # 把include纳入包含目录中
include_directories("${PROJECT_SOURCE_DIR}/include/glm")

link_directories("${PROJECT_SOURCE_DIR}/lib")
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS on)

aux_source_directory(./src DIR_ALL_SRC) # src目录下所有文件取个DIR_ALL_SRC名字

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

add_executable(${PROJECT_NAME} ${DIR_ALL_SRC}) # 生成可执行文件

target_link_libraries(${PROJECT_NAME} "libassimp-5.dll" "libglfw3.a" "libassimp.dll.a")
