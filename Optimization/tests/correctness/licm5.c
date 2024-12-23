int do_loop1(int x, int y, int* z) {
    do{
        x = *z + y;
    } while(x < 0);
    return x;
}

int do_loop2(int x, int y, int* z, int* p) {
    int pp;
    do {
        x = *z + y;
        pp = *p + y;
    } while (x < 0);
    return x;
}

int do_loop3(int x, int y, int* z) {
    int pp = 2;
    do{
        *z = pp;
    } while(x < 0);
    return x;
}

int main() {
    int x = 2;
    int y = 3;
    return do_loop1(2, 3, &x) + do_loop2(3, 2, &y, &x) + do_loop3(1, 1, &x);
}