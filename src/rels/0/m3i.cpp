#include "m3i.h"

#include <cstring>
#include <iostream>
#include <stdexcept>

inline int min(const int a, const int b) { return (a < b) ? a : b; }

typedef const std::lock_guard<std::mutex> lock_guard;

M3i::M3i() = default;

// {{{123}, {123}}, {{123}, {123}}, {{123}, {123}}, ...}
M3i::M3i(
    std::initializer_list<std::initializer_list<std::initializer_list<int>>>
        ilist) {
}

M3i::M3i(int d0, int d1, int d2) {
  tensor = new Tensor();
  tensor->shape[0] = d0;
  tensor->shape[1] = d1;
  tensor->shape[2] = d2;
  tensor->capacity = d0 * d1 * d2;
  CheckDims();
  tensor->data = new int **[d0];
  for (int i = 0; i < d0; ++i) {
      tensor->data[i] = new int *[d1];
      for (int j = 0; j < d1; ++j) {
          tensor->data[i][j] = new int[d2];
      }
  }
}

M3i::M3i(int d0, int d1, int d2, int fill) {
  tensor = new Tensor();
  tensor->shape[0] = d0;
  tensor->shape[1] = d1;
  tensor->shape[2] = d2;
  tensor->capacity = d0 * d1 * d2;
  CheckDims();
  tensor->data = new int **[d0];
  for (int i = 0; i < d0; ++i) {
      tensor->data[i] = new int *[d1];
      for (int j = 0; j < d1; ++j) {
          tensor->data[i][j] = new int[d2];
            for (int k = 0; k < d2; ++k) {
              tensor->data[i][j][k] = fill;
            }
      }
  }
}

// легкая копия(подсчет ссылок)
M3i::M3i(const M3i &other) : tensor(other.tensor) { }

// легкая копия(подсчет ссылок)
M3i &M3i::operator=(const M3i &other) {
    return *this;
}

M3i::M3i(M3i &&other) : tensor(other.tensor) {  }

M3i &M3i::operator=(M3i &&other) {
  return *this;
}

M3i::~M3i() { free(); }

// полная копия данных
M3i M3i::Clone() const {
  return *this;
}

// except: хотя бы один из индексов меньше нуля или больше
// соответствующей размерности
M3i &M3i::Resize(int d0, int d1, int d2) {
  return *this;
}

// except: хотя бы один из индексов меньше нуля или больше
// соответствующей размерности
int &M3i::At(int i, int j, int k) {
    return tensor->data[0][0][0];
}

// except: хотя бы один из индексов меньше нуля или больше
// соответствующей размерности
int M3i::At(int i, int j, int k) const {
    return tensor->data[0][0][0];
}

// получение размера по измерению 0, 1, 2
// except: dim < 0 or dim > 2
int M3i::Size(int dim) const {
  return 0;
}

// заполнение одним и тем же значением
void M3i::Fill(int val) {
}

std::ostream &M3i::WriteTo(std::ostream &out) const {
  return out;
}

std::istream &M3i::ReadFrom(std::istream &in) {
  return in;
}

std::istream &operator>>(std::istream &in, M3i &m) { return m.ReadFrom(in); }

std::ostream &operator<<(std::ostream &out, const M3i &m) {
  return m.WriteTo(out);
}

void M3i::CheckDims() {
  if (tensor->shape[0] <= 0 || tensor->shape[1] <= 0 || tensor->shape[2] <= 0) {
    throw std::invalid_argument("dimensions must be above zero");
  }
}

void M3i::CheckDims(int d0, int d1, int d2) const {
  if (d0 <= 0 || d1 <= 0 || d2 <= 0) {
    throw std::invalid_argument("dimensions must be above zero");
  }
}

void M3i::CheckIndexes(int d0, int d1, int d2) const {
  if (d0 < 0 || d1 < 0 || d2 < 0 || tensor->shape[0] <= d0 ||
      tensor->shape[1] <= d1 || tensor->shape[2] <= d2) {
    throw std::out_of_range("index(es) out of range");
  }
}

void M3i::free() {
  if (tensor == nullptr) return;

  lock_guard(tensor->mutex);

  if (--tensor->ref_counter == 0) {
    for (int i = 0; i < tensor->shape[0]; ++i) {
      for (int j = 0; j < tensor->shape[1]; ++j) {
        delete[] tensor->data[i][j];
      }
      delete[] tensor->data[i];
    }
    delete[] tensor->data;
    delete tensor;
  }
  tensor = nullptr;
}