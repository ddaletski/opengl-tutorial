#version 330 core

layout (location = 0) in vec3 aPos;   
layout (location = 1) in vec3 aColor; 
layout (location = 2) in vec2 aTextureCoord; 

uniform float var_xPos;
  
out vec3 ourColor; 
out vec2 texture1Coord;
out vec2 texture2Coord;

#define M_PI 3.1415926535897932384626433832795

void main()
{
    gl_Position = vec4(aPos.x + var_xPos, aPos.y, aPos.z, 1.0);

    ourColor = aColor; 
    texture1Coord = aTextureCoord;
    texture2Coord = aTextureCoord;
}
