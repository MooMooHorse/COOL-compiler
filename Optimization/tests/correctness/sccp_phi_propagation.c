#include <stdio.h>

int phi_example() {
    int a;
    if (1 == 1) {
        a = 42;
    } else {
        a = 0;
    }
    return a;
}

int main() {
    printf("%d\n", phi_example());
    return 0;
}
