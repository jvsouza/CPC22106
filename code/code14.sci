function x = gauss_sem_pivot( A, b )
//-----------------------------------------------------------------------------
// Cabeçalho-------------------------------------------------------------------
//
// Proposta: Eliminação de Gauss sem Pivotamento
//
//  x -> retorna o vetor solução
//  A -> entrada da matriz de coeficientes
//  b -> entrada da vetor coluna de estimulos
//
// Chamada de Função:
//  A = [ 10 2 -1;  -3 -5 2;    1 1 6 ];
//  b = [ 27;       -61.5;      -21.5 ];
//  x = gauss_sem_pivot( A, b )

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