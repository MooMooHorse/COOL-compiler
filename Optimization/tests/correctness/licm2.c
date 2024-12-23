
int do_loop(int x, int y, int* z) {
    do{
        x = *z + y;

    } while(x < 0);
    return x;
}

int main() {
    int x  = 2;
    return do_loop(2, 3, &x);
}