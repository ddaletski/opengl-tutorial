file(GLOB LUT3D_SOURCES ${SRC_DIR}/lut3d/*.cpp)

add_executable(lut3d ${LUT3D_SOURCES})
target_link_libraries(lut3d common glfw glad stb dl OpenGL::OpenGL)