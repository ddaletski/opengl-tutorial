#pragma once

#include "shader.h"

#include <vector>

#include <stb/stb_image.h>

typedef unsigned char uchar;

struct Image {
    std::vector<uchar> data;
    int width;
    int height;
    int channels;

    Image(const std::string& imgPath, bool flip=true) {
        stbi_set_flip_vertically_on_load(flip);

        uchar* imgData = stbi_load(imgPath.c_str(), &width, &height, &channels, 0); 
        if(imgData == nullptr) {
            std::ostringstream ss;
            ss << "can't load image from file " << imgPath;
            throw std::runtime_error(ss.str());
        }

        data.resize(width * height * channels);
        std::move(imgData, imgData + data.size(), data.data());
    }
};
