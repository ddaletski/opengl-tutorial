#version 330 core

out vec4 FragColor;  
in vec3 ourColor;
in vec2 texture1Coord;
in vec2 texture2Coord;

uniform sampler2D texture1;
uniform sampler2D texture2;
uniform float mixValue;
  
void main()
{
    vec4 color0 = vec4(ourColor, 1.0);
    vec4 color1 = texture(texture1, texture1Coord);
    vec4 color2 = texture(texture2, texture2Coord);
    FragColor = color0 * mix(color1, color2, mixValue);
}
