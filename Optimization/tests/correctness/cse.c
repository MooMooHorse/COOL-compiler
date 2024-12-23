
int main() {
    int x = 20;
    int y = 30;
    int a = x + y;
    int b = x - y;
    int c = x * y;


    while(x < y) {
        if(x + y < a) {
            c = x - y;
            b = x - y;
        } else {
            c = x * y;
            b = x * y;
        }
        x = x + 1;
    }

    return b;
}