//
// Project  Metthod to aprox. dif. One Example
// File     aproxDifOne.sci
// Author   Jonas Vieira de Souza
// Created  2017-02-24
// Modified 2017-02-24
// Version  1.0
// Purpose:
//

    //Use a aproximação por diferenças progressiva e regressiva O( h  );
    //E a aproximação por diferença  centrada O( h2 );
    //Ache a derivada primeira de f(x) = 25x3 – 6x2 + 7x - 88;
    //Faça o cálculo em x = 2.0, usando o passo de cálculo de 0,5 e 0,25;
    //Compare as suas estimativas com o valor real da derivada;
    //Interprete seus resultados com base no resto da expansão em séries de Taylor;
    //Calcule manualmente e com o auxilio de um script Scilab.

clear;
clc;

xi = input('Entre com o valor de xi: ');
h = input('Entre com o passo de cálculo: ');
disp('Dado os coef. da f. polinomial: 25x^3 - 6x^2 + 7x -88');

vetor = [-88 7 -6 25];
f = poly(vetor,'x','c');
disp(f, 'f(x)');
flinha = derivat(f);
disp(flinha,'f ́(x)');

vreal = horner(flinha, xi);
printf("\n\nf''(2) = %d\n\n", vreal);


f_xi_p_h = horner(f, xi+h);
f_xi = horner(f, xi);
f_xi_m_h = horner(f, xi-h);

diferenca = 'progressiva';
dfdt = (f_xi_p_h - f_xi) / h;

for i=1:3
    printf("Diferença %s:\n", diferenca);
    et = abs((vreal-dfdt)/vreal) * 100;
    printf("O valor aproximado da derivada em x = %.2f é %f\n", xi, dfdt);
    printf("O erro relativo verdadeiro parcentual vale %f %%\n\n\n", et);
    if i == 1 then
        diferenca = 'regressiva';
        dfdt = (f_xi - f_xi_m_h) / h;
    elseif i == 2 then
        diferenca = 'centrada';
        dfdt = (f_xi_p_h - f_xi_m_h) / (2*h);
    end
end