#include <stdlib.h>

int foo(int n) {
  int i = 1;
  int j;
  while (0 < n) {
    j = i;
    i = rand() % 7 - (3 + j);
    n += i;
    if (j > 0) {
      i = j;
    } else {
      while (i < j) {
        j *= 3;
        i *= 4;
      }
    }
  }
  return i;
}
