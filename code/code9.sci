//
// Project  Metthod to aprox. dif. Two Example
// File     aproxDifTwo.sci
// Author   Jonas Vieira de Souza
// Created  2017-02-24
// Modified 2017-02-24
// Version  1.0
// Purpose:
//

	//Use uma aproximação por diferença centrada O( h2 );
	//Ache a derivada segunda de f(x) = – 0,1x4 – 0,15x3 – 0,5x2 – 0,25x + 1,2;
	//Faça o cálculo em x = 0.5, usando o passo de cálculo de de 0,5 e 0,25;
	//Compare as estimativas com o valor verdadeiro da derivada;
	//Interprete os resultados com base no termo do resto da expansão em série de Taylor.

clear;
clc;

xi = input('Entre com o valor de xi: ');
h = input('Entre com o passo de cálculo: ');
disp('Dado os coef. da f. polinomial: - 0.1x^4 - 0.15x^3 - 0.5x^2 - 0.25x + 1.2');

vetor = [ 1.2 -0.25 -0.5 -0.15 -0.1 ];
f = poly(vetor,'x','c');
disp(f, 'f(x)');
flinha = derivat(f);
disp(flinha,'f ́(x)');

vreal = horner(flinha, xi);
printf("\n\nf''(2) = %d\n\n", vreal);

f_xi_p_h = horner(f, xi+h);
f_xi = horner(f, xi);
f_xi_m_h = horner(f, xi-h);

printf("Diferença centrada\n");

dfdt = (f_xi_p_h - f_xi_m_h) / (2*h);
et = abs((vreal-dfdt)/vreal) * 100;
printf("O valor aproximado da derivada em x = %.2f é %f\n", xi, dfdt);
printf("O erro relativo verdadeiro parcentual vale %f %%\n\n\n", et);

