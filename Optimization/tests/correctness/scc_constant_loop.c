#include <stdio.h>

int constant_loop() {
    int i = 0;
    while (i != 3) {
        i = i + 1;
    }
    return i;
}

int main() {
    printf("%d\n", constant_loop());
    return 0;
}
