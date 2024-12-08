#include <stdlib.h>

int foo(int n) {
  int i = 1;
  int j;
  while (0 < n) {
    j = i;
    i = rand() % 4 - (1 + j);
    n += i;
    if (j > 0) i = j;
  }
  return i;
}
