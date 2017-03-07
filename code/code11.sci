function [ raiz, n ] = newton_raphson( fun, dx, es, maxi )

//-----------------------------------------------------------------------------
// Cabecalho-------------------------------------------------------------------
//
// Proposta: Implementacao do método de Newton-Raphson
//
//  raiz -> retorna a raiz encontrada
//  n    -> retorna o número de iterações
//  fx   -> entrada da funcao desejada
//  es   -> entrada do critério de parada ( opcional )
//  maxi -> entrada do nº máximo de iterações ( opcional )
//
// Chamada de Função:
//  fx = 'log(x) + x'
//  dx = '(1/x) + 1'
//  [raiz, n]=newton_raphson(fun, dxdt, 0.01, 50)


//-----------------------------------------------------------------------------
// Se argumentos não forem informados------------------------------------------
    if argn(2) < 4 then
        max = 50;
        if argn(2) < 3 then
            es = 0.0001;
        end
    end

//-----------------------------------------------------------------------------
// Variaveis Pre-Definidas-----------------------------------------------------
    ea = 100;           // Erro absoluto
    n = 0;              // Numero de iterações

//-----------------------------------------------------------------------------
// Variaveis Recebidas---------------------------------------------------------
    a = input("Entre com o limite inferior de x: ");
    b = input("Entre com o limite superior de x: ");
    x = linspace( a, b, 100 );

    fx = evstr(fun);
    plot2d(x, fx);
    xgrid;

    x0 = input('Entre com as aprox. iniciais x0 = '); // Pede aprox. inicial
    x = x0;

//-----------------------------------------------------------------------------
// Desenvolvimento-------------------------------------------------------------
    printf("Iteração\txi\t\t|Ea|%%\n");
    while ( ea > es )  &  ( n < maxi )  do
        fxi = evstr(fun);
        dxi = evstr(dx);

        xi = x - ( fxi / dxi );

        if xi ~= 0 then
            ea = abs((xi - x)/xi)*100; //cálculo do erro relativo
        end

        printf("%f\t%f\t%f\n",n,xi,ea);
        x = xi;
        n = n + 1;
    end

    if ( n >= maxi ) then
        raiz = 'Divergiu!';
    else
        raiz = xi;
    end

endfunction
