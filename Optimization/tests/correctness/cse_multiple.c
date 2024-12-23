#include <stdio.h>

int main() {
    int a = 5, b = 3;
    int c = a * b + 2;
    int d = a * b + 2; // Redundant expression
    printf("%d %d\n", c, d);
    return 0;
}
