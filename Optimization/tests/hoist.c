#include<stdio.h>


int main(){
    int x;
    int a = 5;

    for(int i = 0; i < 10; i++) {
        x = a * 2;
    }
    
    if(x == 10){
        return 1;
    }
    
    return 0;

}