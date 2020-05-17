cmake_minimum_required(VERSION 3.15)

project(gl_tutorial)

set(CMAKE_CXX_STANDARD 17)

if(NOT(CMAKE_BUILD_TYPE STREQUAL "Debug"))
    add_compile_options(-O3)
endif()

set(SRC_DIR ${CMAKE_CURRENT_LIST_DIR}/src)
set(3RD_DIR ${CMAKE_CURRENT_LIST_DIR}/3rd)
set(CMAKE_DIR ${CMAKE_CURRENT_LIST_DIR}/cmake)

include_directories(${3RD_DIR})
include_directories(${SRC_DIR})

file(GLOB_RECURSE COMMON_SRC ${SRC_DIR}/common/*.cpp)
add_library(common STATIC ${COMMON_SRC})

set(GLAD_SRC ${3RD_DIR}/glad/glad.c)
add_library(glad STATIC ${GLAD_SRC})

file(GLOB STB_SRC ${3RD_DIR}/stb/*.cpp)
add_library(stb STATIC ${STB_SRC})

find_package(glfw3 3.3 REQUIRED)
set(OpenGL_GL_PREFERENCE LEGACY)
find_package(OpenGL REQUIRED)

include(${CMAKE_DIR}/gamutTexture.cmake)
include(${CMAKE_DIR}/lut3d.cmake)


add_custom_target(copyData ALL
    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${SRC_DIR}/shaders
        ${CMAKE_CURRENT_BINARY_DIR}/shaders

    COMMAND ${CMAKE_COMMAND} -E copy_directory
        ${CMAKE_CURRENT_LIST_DIR}/textures
        ${CMAKE_CURRENT_BINARY_DIR}/textures
)