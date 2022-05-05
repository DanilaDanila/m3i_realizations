#include <m3i/m3i.h>

#include <cassert>
#include <chrono>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>

uint64_t measure(int x, int y, int z, int fill) {
  if (fill == -1) {
    std::chrono::steady_clock::time_point begin =
        std::chrono::steady_clock::now();

    M3i m3i(x, y, z);

    std::chrono::steady_clock::time_point end =
        std::chrono::steady_clock::now();

    return std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin)
        .count();
  } else {
    std::chrono::steady_clock::time_point begin =
        std::chrono::steady_clock::now();

    M3i m3i(x, y, z, fill);

    std::chrono::steady_clock::time_point end =
        std::chrono::steady_clock::now();

    return std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin)
        .count();
  }
}

int main(int argc, char **argv) {
  if (argc != 4) {
    std::cout << "Usage: " << argv[0] << " <size> <times> <fill>" << std::endl;
    std::cout << "where\n\t";
    std::cout << "<size> - size of cube\n\t";
    std::cout << "<times> - times measure\n\t";
    std::cout << "<fill> - if <fill> == -1 then\n\t\t\t";
    std::cout << "call M3i(int, int, int)\n\t\t";
    std::cout << "else\n\t\t\t";
    std::cout << "call M3i(int, int, int, <fill>)\n\t\t";
    std::cout << "fi" << std::endl;
    return 0;
  }

  int size = atoi(argv[1]);
  int times = atoi(argv[2]);
  int fill_with = atoi(argv[3]);

  for (int i = 0; i < times; ++i) {
    std::cout << measure(size, size, size, fill_with) << std::endl;
  }

  return 0;
}