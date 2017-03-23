function [raiz,n] = secante( fun, pert, es, maxi )
clc;

//-----------------------------------------------------------------------------
// Cabeçalho-------------------------------------------------------------------
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
//  fun = 'log(x) + x'
//  [ raiz, n ] = secante( fun, 1D-8, 0.0001 )
//  Entre com o limite inferior de x: 0.1
//  Entre com o limite inferior de x: 1
//  Entre com as aprox. iniciais x0 = 0.6
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
    printf("\nSECANTE MODIFICADA\n\n");
    a = input("Entre com o limite inferior de x: ");
    b = input("Entre com o limite superior de x: ");
    x = linspace( a, b, 100 );
    fx = evstr(fun);

    clf();
    plot( x, fx );
    xgrid()

    //entrada do valor inicial
    x = input("Entre com a aproximação inicial da raiz: ");

//-----------------------------------------------------------------------------
// Desenvolvimento-------------------------------------------------------------
    printf("\nn \txi\t\t|ea|%%\n");
    while ( ea > es )  &  ( n < maxi ) do
        f1 = evstr(fun);
        x = x + pert;
        f2 = evstr(fun);
        xi = ( x - pert ) - ( f1 * pert )/( f2 - f1 );

        if ( xi ~= 0 ) then
            ea = abs((xi-x)/xi) * 100;
        end

        n = n + 1;
        printf("%d\t%f\t%f\n", n, xi, ea);
        x = xi;

    end

    if ( n >= maxi ) then
        raiz = 'Divergiu!';
    else
        raiz = xi;
    end

endfunction










