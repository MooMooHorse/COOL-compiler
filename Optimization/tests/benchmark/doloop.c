int foo(int n, int* restrict p, int* restrict q) {
  int i = 1, m = n;
  int j;
  do {
    if (i > 0) *p = m;
    j = i;
    i = m / -3 - (1 + j);
    n += i;
    if (j > 0) i = j;
    *q = m;
  } while (0 < n);
  return i;
}
