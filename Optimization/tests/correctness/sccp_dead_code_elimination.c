#include <stdio.h>

int dead_code_example() {
    if (1 == 0) {
        return 999; // Unreachable code
    } else {
        return 42;
    }
}

int main() {
    printf("%d\n", dead_code_example());
    return 0;
}
