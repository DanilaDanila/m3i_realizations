#include "m3i.h"
#include <cstring>
#include <stdexcept>

M3i::M3i() {
    data = new Data();
}

M3i::M3i(const int x, const int y, const int z) {
    if (x <= 0 || y <= 0 || z <= 0) {
        throw std::out_of_range("X, y, z have to be > 0");
    }
    int*** values = new int **[x];
    for (int i = 0; i < x; ++i) {
        values[i] = new int *[y];
        for (int j = 0; j < y; ++j) {
            values[i][j] = new int[z];
        }
    }
    int shape[3] = {x, y, z};
    data = new Data(values, shape, 1);
}

M3i::M3i(const int x, const int y, const int z, const int default_value) {
    if (x <= 0 || y <= 0 || z <= 0) {
        throw std::out_of_range("X, y, z have to be > 0");
    }
    int*** values = new int **[x];
    for (int i = 0; i < x; ++i) {
        values[i] = new int *[y];
        for (int j = 0; j < y; ++j) {
            values[i][j] = new int[z];
            if (default_value == 0) {
                memset(values[i][j], 0, z * sizeof(int));
                continue;
            } else {
                for (int k = 0; k < z; ++k) {
                    values[i][j][k] = default_value;
                }
            }
        }
    }
    int shape[3] = {x, y, z};
    data = new Data(values, shape, 1);
}


M3i::M3i(const std::initializer_list<std::initializer_list<std::initializer_list<int>>>& list) {}


M3i::M3i(const M3i& other) {}

M3i& M3i::operator=(const M3i& other) {
    return *this;
}

M3i::M3i(M3i&& other) {}

M3i& M3i::operator=(M3i&& other) {
    return *this;
}

M3i::~M3i() {
    deleteCurrent();
}

M3i M3i::Clone() const {
    return *this;
}

M3i& M3i::Resize(const int x, const int y, const int z) {
    return *this;
}

int M3i::At(const int x, const int y, const int z) const {
    return 0;
}

int& M3i::At(const int x, const int y, const int z) {
    return data -> values[0][0][0];
}

int M3i::Size(const int dim) const {
    return 0;
}

void M3i::Fill(const int value) {}

void M3i::deleteCurrent() {
    if (data != nullptr) {
        --data -> ref_counter;
        if (data -> ref_counter == 0) {
            if (data -> values != nullptr) {
                for (int i = 0; i < data->shape[0]; ++i) {
                    for (int j = 0; j < data->shape[1]; ++j) {
                        delete[] data->values[i][j];
                    }
                    delete[] data->values[i];
                }
                delete[] data->values;
            }
            delete data;
        }
    }
}

std::istream& operator>>(std::istream& istrm, M3i& m) {
    return istrm;
}

std::ostream& operator<<(std::ostream& ostrm, const M3i& m) {
    return ostrm;
}