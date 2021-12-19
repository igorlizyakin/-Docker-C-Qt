project(hello_world)
cmake_minimum_required(VERSION 3.0)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 REQUIRED COMPONENTS Core)

add_executable(hello_world main.cpp)

target_include_directories(hello_world PRIVATE ${Boost_INCLUDE_DIRS})

target_link_libraries(hello_world
  PRIVATE
  Qt5::Core
)
