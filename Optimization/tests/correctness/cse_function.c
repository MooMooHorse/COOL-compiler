#include <stdio.h>

int getValue() {
    static int x = 0;
    return ++x; // Non-pure function
}

int main() {
    int a = getValue() * 2;
    int b = getValue() * 2; // Should not eliminate: getValue() changes state
    printf("%d %d\n", a, b);
    return 0;
}
