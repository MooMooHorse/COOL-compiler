
int do_loop(int x, int y, int* z, int* p) {
    int pp;
    do{
        x = *z + y;
        pp = *p + y;
    } while(x < 0);
    return x;
}

int main() {
    int x  = 2;
    int y = 3;
    return do_loop(2, 3, &x, &y);
}