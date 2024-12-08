#include<stdio.h>


int main(){
    int a = 2, b =3;
    int c;

    a = a + b;
    if(a < b) {
        b = a;
        c = 8;
    } else {
        a = b;
        c = 4;
    }

    if(a + b >= c) return 1;

    return 0;

}