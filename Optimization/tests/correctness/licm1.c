
int do_loop(int x, int y, int z) {
    do{
        z = x - y;
    } while(x < 0);
    return z;
}

int main() {
    return do_loop(2, 3, 1);
}