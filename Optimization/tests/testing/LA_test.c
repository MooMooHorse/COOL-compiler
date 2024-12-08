#include <stdio.h>

const int N = 3;

int v1[N] = {0, 1, 2};

int main(){

    for (int i = 0; i < N; i++){
        for (int j = 0; j < N; j++){ 
            v1[i] = v1[i] + v1[j];
        }
    }

    for (int k = 0; k < N; k++){
        v1[k] = v1[k] * 2;
    }
    
    if(0){
        return 1;
    }
    
    return 0;

}