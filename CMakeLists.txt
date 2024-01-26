cmake_minimum_required(VERSION 3.26)

project(renderer_nj LANGUAGES CXX)

find_package(glm REQUIRED)

include_directories("${PROJECT_SOURCE_DIR}/include")
include_directories("D:/Code/include")
include_directories(${GLM_INCLUDE_DIRS})

set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS on)

aux_source_directory(./src DIR_ALL_SRC)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

link_directories("D:/Code/lib")

add_executable(${PROJECT_NAME} ${DIR_ALL_SRC})
target_link_libraries(${PROJECT_NAME} ${GLM_LIBRARIES})
target_link_libraries(${PROJECT_NAME} "libassimp-5.dll" "libglfw3.a" "libassimp.dll.a")
