//
// Project  Method infinite series Example
// File     infiniteSerie.c
// Author   Jonas Vieira de Souza
// Created  2016-12-05
// Modified 2016-12-05
// Version  1.0
// Purpose: The infinite series converges to the value of f (n) = π4 / 90 when n approaches infinity.
//          Single precision code that calculates the interaction 1-10000 , incrementing by 1.
//          Also in reverse order. With estimated real relative percentage error
//

#include <stdio.h>
#include <stdlib.h>

int main(){
    float i;    // float por causa do i^4, int não suporta
    double erro;
    double const real = 1.082323;

    //CRESCENTE
    float fn=0;
    for(i=1;i<=10000;i++){
        fn = fn + (1.0/(i*i*i*i));
    }
    erro = ( real - fn ) *100/real;
    printf("\nErro, serie crescente: %lf\n", erro);
    printf("Valor: %f\n", fn);

    //DECRESCENTE
    fn = 0;
    for(i=10000;i>=1;i--){
        fn = fn + (1.0/(i*i*i*i));
    }
    erro = ( real - fn ) *100/real;
    printf("\nErro, serie decrescente: %lf\n", erro);
    printf("Valor: %f\n", fn);

    return 0;
}