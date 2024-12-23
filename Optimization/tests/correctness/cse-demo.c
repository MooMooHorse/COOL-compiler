void test1(char c, int* x, volatile int* y) {
    int p = c;
    int q = c;
    *x = p;
    *x = q;
    *y = p;
    *y = q;
}

void test2(float x, float y, int* m, int* n) {
    int c;
    int d;
    c = x + y;
    *m = c;

    d = x + y;
    *n = d;
}

void g(int x) {
    return ;
}

void test3(int* p) {
    if(!p) {
        g(!p);
    }
}

int main() {
    int x = 3;
    int y = 4;
    int m = 5;
    test1('a', &x, &y);
    test2(1.0, 2.0, &m, &x);
    test3(&m);
    return x + y + m;
}