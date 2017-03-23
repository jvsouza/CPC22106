function x = gauss_com_pivot( A, b )
//-----------------------------------------------------------------------------
// Cabeçalho-------------------------------------------------------------------
//
// Proposta: Encontrar as correntes de malhas de circuito, utilizando o método de eliminação de Gauss com pivotamento.
//
//  x -> retorna o vetor solução
//  A -> entrada da matriz de coeficientes
//  b -> entrada da vetor coluna de estimulos
//
// Chamada de Função:
//  A = [ 5 1 6   ;
//        6 1 1 8 ;
//        8 1 6   ;
//        3 2 1 1 ;
//        2 4 1 1
//      ];
//
//  b = [ 12;  00;  09;  06;  10 ];
//  x = gauss_com_pivot( A, b )

clc;

//-----------------------------------------------------------------------------
// Se argumentos não forem informados------------------------------------------
[lA,cA] = size(A);
if lA ~= cA then
    error("A matriz A deve ser quadrada");
end

[lB, cB] = size(b);
if lA ~= lB then
    error("A matriz b deve conter o mesmo numero de linhas de A");
end

//-----------------------------------------------------------------------------
// Variaveis Pre-Definidas-----------------------------------------------------
SIS = [A b];    // O Scilab criará uma matriz com ambas matrizes, no caso 3x4
cA = cA + 1;

//-----------------------------------------------------------------------------
// Desenvolvimento-------------------------------------------------------------
for i = 1: lA - 1

    disp(SIS);
    // Pivotamento

        // método 1
            maior = A(i,i);
            indMaior = i;
            for k = i:lA
                if abs(A(k,i)) > abs(maior) then
                    maior = A(k,i);
                    indMaior = k;
                end
            end

        // método 2
            // [ maior, k ] = max( abs( SIS(i,n,i) ) );
            // l = i + k + 1;
            // if l ~= i then
            //      SIS([l,i],.) = SIS(l,i,.)
            // emd
    disp(SIS);

    // Troca de linhas
    if indMaior ~= i then
        SIS([indMaior,i],:) = SIS([i,indMaior],:);
        //B(1,:) = SIS(indMaior,:);
        //SIS(indMaior,:) = SIS(i,:);
        //SIS(i,:) = B(1,:);
    end
    disp(SIS);
    for j = i + 1: lA
        mult = SIS(j, i)/SIS(i,i);

//      for k = i: cA
//          SIS(j,k) = SIS(j,k) - mult*SIS(i,k);
//      end
        SIS(j,i:cA) = SIS(j,i:cA) - mult*SIS(i,i:cA);
        // Verificação do método
        // Mostrando todos os passos da eliminação
        disp(SIS);
    end
end

// Substituição regressiva
x = zeros(lA, 1);
x(lA) = SIS(lA,cA)/SIS(lA,lA);

// passo decrescente
for i = cA - 1.:-1:1
    x(i) = ( SIS(i, cA) -  SIS(i,(i+1):lA)*x((i+1):lA) )/ SIS(i,i) ;
    // Usando um for implícito para o somatório
end

endfunction