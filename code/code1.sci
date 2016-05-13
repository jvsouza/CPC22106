//
// Project  Method series of potential Example
// File     seriePot.sci
// Author   Jonas Vieira de Souza
// Created  2016-12-05
// Modified 2016-12-05
// Version  1.0
// Purpose:
// 

function [fx,term]=cpc_series(fun, fun_r, x, n_sig)

if argn(2) < 4 then
    n_sig = 3;
end

// Definir o critério de parada
// εs=(0,5⋅102−n (1.7)
es = 0.005 * 10^(2-n_sig);
fx=0; fx_old = 0; n = 0 ; v_r = evstr(fun_r);

printf("Termo\t\tResultado\tE(t)\t\tE(a)\n");
while 1 do
    fx = fx + evstr(fun);
    erro    = abs((fx-fx_old)/fx);
    e_real  = abs((v_r-fx)/v_r);
    printf("%f\t%f\t%f\t%f\n", n+1, fx, e_real*100,erro*100);
    if(erro<es) then
        break;
    end        
    fx_old = fx;
    n = n+1;
end
    term = n+1;
endfunction

// Cálculo de funções com serie de potências
// function [fx,term]=series(funcao, x, n_sig)
// onde fx é o valor da função e x
// term é o número de termos usados para o erro especificado
// fun é a função de entrada literal em x e n
// onde n é o numero do termo
// n_sig é o numero de alg. sign. da resposta - opcional
// Exemplo de chamada:
// exec('path\series.sci',-1)
// fun ='x^n/factorial(n)'
// fun_r = 'exp(x)'
// [fx,term]=series(fun, fun_r, 5, 3)
//
//O valor de fun é calculado com o auxílio de evstr(fun);
