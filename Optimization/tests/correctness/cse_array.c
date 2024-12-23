#include <stdio.h>

int main() {
    int arr[3] = {1, 2, 3};
    int x = arr[1] + arr[2];
    int y = arr[1] + arr[2]; // Redundant computation
    printf("%d %d\n", x, y);
    return 0;
}
