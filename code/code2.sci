//
// Project	Method division and medium Example
// File		metDivMed.sci
// Author	Jonas Vieira de Souza
// Created	2016-12-05
// Modified	2016-12-05
// Version	1.0
// Purpose:
// 

function cpc_divMed( root, numSig )
    defStop = 0.005 * 10^( 2 - numSig );    
    numOld = root/2;
    
    while 1 do            
        numCurrent = ( numOld + root / numOld)/2;
        errorApprox = abs( (numCurrent - numOld) / numCurrent );
        numOld = numCurrent;
        
        if ( errorApprox < defStop ) then
             break;
        end
    end        
    printf("\tA root quadrada de %d é: %d.", root,  numOld);    
endfunction
