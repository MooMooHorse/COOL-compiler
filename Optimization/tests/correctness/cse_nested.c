#include <stdio.h>

int main() {
    int a = 4, b = 6;
    int x = (a + b) * (a + b); // Redundant subexpression (a + b)
    printf("%d\n", x);
    return 0;
}
