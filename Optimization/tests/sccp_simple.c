int sccp_simple() {
    int x = 5 + 10;   // x = 15
    int cond = (x == 15);

    if (cond) {
        int y = x + 1;
        return y;
    } else {
        int z = x + 2;
        return z;
    }
}