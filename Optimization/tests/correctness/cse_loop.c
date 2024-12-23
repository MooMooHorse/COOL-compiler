#include <stdio.h>

int main() {
    int sum = 0;
    for (int i = 0; i < 10; i++) {
        int x = i * 2;  // Common subexpression
        int y = i * 2;  // Redundant computation
        sum += x + y;
    }
    printf("Sum: %d\n", sum);
    return 0;
}
