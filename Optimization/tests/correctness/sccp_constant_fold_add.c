#include <stdio.h>

int constant_fold_add() {
    int a = 10 + 20;
    return a;
}

int main() {
    printf("%d\n", constant_fold_add());
    return 0;
}
