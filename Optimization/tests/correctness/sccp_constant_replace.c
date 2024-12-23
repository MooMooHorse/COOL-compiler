#include <stdio.h>

int constant_replace() {
    int x = 2 + 2;
    if (x == 4) {
        return 100;
    } else {
        return 0;
    }
}

int main() {
    printf("%d\n", constant_replace());
    return 0;
}
