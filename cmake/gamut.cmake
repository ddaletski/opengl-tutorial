file(GLOB GAMUT_SOURCES ${SRC_DIR}/gamut/*.cpp)

add_executable(gamut ${GAMUT_SOURCES})
target_link_libraries(gamut common glfw glad dl OpenGL::OpenGL)