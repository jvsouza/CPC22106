function [raiz,n] = secante( fun, pert, es, maxi)

//-----------------------------------------------------------------------------
// Cabecalho-------------------------------------------------------------------
//
//  Localiza a raíz de uma funcao pelo Método Secante
//
//  raiz -> retorna a raiz encontrada
//  n    -> retorna o número de iterações
//  fun  -> entrada da funcao pesquisa
//  pert -> entrada da pertubacao
//  es   -> entrada do critério de parada ( opcional )
//  maxi -> entrada do nº máximo de iterações ( opcional )

//
//  Exemplo de chamada:
//
//  fun = 'log(x) +x'
//  [ raiz, n ] = secante( fun, 1D-6, 0.1 )
//

//-----------------------------------------------------------------------------
// Se argumentos não forem informados------------------------------------------
    if argn(2) < 4 then
        maxi = 50;
        if argn(2) < 3 then
            es = 0.0001;
            if argn(2) < 2 then
                pert = 1D-6;
            end
        end
    end

//-----------------------------------------------------------------------------
// Variaveis Pre-Definidas-----------------------------------------------------
    ea = 100;           // Erro absoluto
    n = 0;              // Numero de iterações

//-----------------------------------------------------------------------------
// Variaveis Recebidas---------------------------------------------------------
    //a = input("Entre com o limite inferior de x: ");
    //b = input("Entre com o limite superior de x: ");
    //x = linspace( a, b, 100 );

    //fx = evstr(fun);
    //plot(x, fx);
    //xgrid;

    //entrada do valor inicial
    //xo = input("Entre com a aproximação inicial da raiz: ");
    x = x0;

//-----------------------------------------------------------------------------
// Desenvolvimento-------------------------------------------------------------
    while ( ea > es )  &  ( n < maxi ) do
        f1 = evstr(fun);
        temp = x
        x = x*pert + x;

        f2 = evstr(fun);
        x = temp;

        xi = x - (f1*pert*x/(f2 - f1));

        if ( xi ~= 0 ) then
            ea = abs((xi-x)/xi) * 100;
        end

        printf("%f\t%f\t%f\n", n, xi, ea);
        x = xi;
        n = n + 1;
    end

    if ( n >= maxi ) then
        raiz = 'Divergiu!';
    else
        raiz = xi;
    end

endfunction
