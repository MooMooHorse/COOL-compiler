#include <stdlib.h>

int foo(int n) {
  int i = 1;
  int j;
  do {
    j = i + 1;
    i = rand() % 4 - (1 + j) + n;
    if (j > 0) i = j;
  } while (j < 2);
  return i;
}
