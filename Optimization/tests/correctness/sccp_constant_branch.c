#include <stdio.h>

int constant_branch() {
    if (1 == 1) {
        return 42;
    } else {
        return 0;
    }
}

int main() {
    printf("%d\n", constant_branch());
    return 0;
}
