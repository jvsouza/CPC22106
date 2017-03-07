function [ raiz, n ] = ponto_fixo( func, x0, maxi, es )

//-----------------------------------------------------------------------------
// Cabecalho-------------------------------------------------------------------
//
//  Localiza a raíz de uma funcao pelo Método da Iteração de Ponto Fixo Simples
//
//  raiz -> retorna a raiz encontrada
//  n    -> retorna o número de iterações
//  func -> entrada da funcao pesquisa
//  x0   -> entrada da aproximação inicial
//  maxi -> entrada do nº máximo de iterações ( opcional )
//  es   -> entrada do critério de parada ( opcional )
//
//  Exemplo de chamada:
//
//  func = 'sin(sqrt(x))'
//  [raiz,n]=simples(fun,0.1,1)
//

//-----------------------------------------------------------------------------
// Se argumentos não forem informados------------------------------------------
    if argn(2) < 4 then
        es = 0.0001;    // "ES" usa-se 0,0001%
    end

    if argn(2) < 3 then
        maxi = 50;      // "MAXI" usa-se 50
    end

//-----------------------------------------------------------------------------
// Variaveis-------------------------------------------------------------------
    i  = 0;     //retorno do número de iterações
    x  = x0;    // ...
    ea = 100;   // ...

//-----------------------------------------------------------------------------
// Desenvolvimento-------------------------------------------------------------
    printf("n\txi\t\t|ea|%%\n");
    while ( ea > es )  &  ( i < maxi ) do
        xi = evstr(func);
        i = i + 1;
        if ( xi ~= 0 ) then
            ea = abs((xi - x)/xi)*100; //cálculo do erro relativo
        end
        x = xi;
        printf("%d\t%f\t%f\n", i, xi, ea);
    end

    if i >= maxi then
        raiz = 'divergiu';
    else
        raiz = xi;
    end
    n = i;

endfunction
