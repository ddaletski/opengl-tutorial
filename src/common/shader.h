#ifndef SHADER_H
#define SHADER_H

#include <glad/glad.h>

#include <string>
#include <fstream>
#include <sstream>
#include <iostream>

class Shader
{
public:
    Shader(const char *vertexPath, const char *fragmentPath);
    Shader(const std::string& vertexPath, const std::string& fragmentPath);
    Shader(std::istream& vertexStream, std::istream& fragmentStream);

    void use()
    {
        glUseProgram(_id);
    }

    void setBool(const std::string &name, bool value) const
    {
        glUniform1i(glGetUniformLocation(_id, name.c_str()), (int)value);
    }

    void setInt(const std::string &name, int value) const
    {
        glUniform1i(glGetUniformLocation(_id, name.c_str()), value);
    }

    void setFloat(const std::string &name, float value) const
    {
        glUniform1f(glGetUniformLocation(_id, name.c_str()), value);
    }

    unsigned int id() const
    {
        return _id;
    }

private:
    unsigned int _id;

    void checkCompileErrors(unsigned int shader, std::string type);

};
#endif