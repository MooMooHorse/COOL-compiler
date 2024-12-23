#include <stdio.h>

int main() {
    int a = 10;
    int b = 20;
    int c = a + b;
    int d = a + b; // Redundant computation
    printf("%d %d\n", c, d);
    return 0;
}