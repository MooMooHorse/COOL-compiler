#include <stdio.h>

int neutral_elements(int input) {
    int a = input + 0;
    int b = a * 1;
    return b;
}

int main() {
    printf("%d\n", neutral_elements(5));
    return 0;
}