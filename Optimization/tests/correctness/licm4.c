
int do_loop(int x, int y, int* z) {
    int pp = 2;
    do{
        *z = pp;
    } while(x < 0);
    return x;
}

int main() {
    int x  = 2;
    return do_loop(2, 3, &x);
}