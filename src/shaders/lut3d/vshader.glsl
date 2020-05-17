#version 330 core

layout (location = 0) in vec2 aPos;   
layout (location = 1) in vec2 aTextureCoord; 

out vec2 imgCoord;

#define M_PI 3.1415926535897932384626433832795

void main()
{
    gl_Position = vec4(aPos, 0.0, 1.0);
    imgCoord = aTextureCoord;
}
