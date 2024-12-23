#include <stdio.h>

int main() {
    int a = 5, b = 10, c;
    if (a + b > 0) {
        c = a + b; // Redundant with the condition
    } else {
        c = 0;
    }
    printf("%d\n", c);
    return 0;
}
