#version 330 core

out vec4 FragColor;  
in vec2 imgCoord;

uniform sampler2D var_image;
uniform sampler3D var_lut1;
uniform sampler3D var_lut2;
uniform float mixValue;
  
void main()
{
    vec4 imgColor = texture(var_image, imgCoord);
    vec3 lutCoord = imgColor.xyz;

    vec4 color1 = texture(var_lut1, lutCoord);
    vec4 color2 = texture(var_lut2, lutCoord);

    FragColor = mix(color1, color2, mixValue);
}