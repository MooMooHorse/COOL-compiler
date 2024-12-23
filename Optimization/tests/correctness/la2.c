int crazy_loops(int p) {
    int x = 5; 
    int y = x * x;
    int z = x * x + x - y;
    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
            do {
                x = x * x;
                if(x > 10) {
                    y = y * y;
                }
            } while(x < p * p);
        }
        z = z + 1;
    } while(x < p);
    x = 50;
    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
            do {
                x = x * x;
                if(x > 10) {
                    y = y * y;
                }
            } while(x < p * p);
        }
        z = z + 1;
    } while(x < p);
    x = p;
    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
            do {
                x = x * x;
                if(x > 10) {
                    y = y * y;
                }
            } while(x < p * p);
        }
        z = z + 1;
    } while(x < p);
    return z;
}

int main() {
    return crazy_loops(50);
}