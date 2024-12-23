
int m[10];
int crazy_loops(int p) {
    int x = 5; 
    int y = x * x;
    int z = x * x + x - y;
    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
        }
        z = z + 1;
    } while(x < p);

    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
        }
        z = z + 1;
    } while(x < p);

    m[0] = x;
    m[1] = y;
    m[2] = z;
    m[3] = m[0] + m[1] + m[2];
    m[4] = m[0] + m[1] - m[2];
    m[5] = m[0] - m[1] + m[2];
    m[6] = m[0] - m[1] - m[2];

    for (int i = 0; i < 10; i++) {
        m[i] = m[i] + 1;
    }

    for (int i = 1; i < 10; i++) {
        m[i] = m[i] + m[i - 1];
    }

    for(int i = 0; i < 9; i++) {
        m[i] = m[i] + m[i + 1];
    }

    do {
        while(x + y < z) {
            x = x + 1;
            y = y + 1;
        }
        z = z + 1;
        m[2] += y;
        for(int i = 0; i < 9; i++) {
            m[i] = m[i] + m[i + 1];
        }
    } while(m[0] < p);


    return m[2];
}

int main() {
    return crazy_loops(1000);
}