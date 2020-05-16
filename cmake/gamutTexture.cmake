file(GLOB GAMUT_SOURCES ${SRC_DIR}/gamutTexture/*.cpp)

add_executable(gamutTexture ${GAMUT_SOURCES})
target_link_libraries(gamutTexture common glfw glad stb dl OpenGL::OpenGL)