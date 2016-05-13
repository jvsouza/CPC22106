//
// Project  Calcule EPS number the machine Example
// File     machineEPS.sci
// Author   Jonas Vieira de Souza
// Created  2016-12-05
// Modified 2016-12-05
// Version  1.0
// Purpose:
// 

function cpc_eps()

    v_eps = 1;
    while 1 do
        if((1+v_eps)<=1) then
            break;
        end
        v_eps = v_eps/2;
    end
    
    printf("EPS da máquina\t: %g\n", %eps);
    printf("EPS calculado\t: %g", v_eps*2);

endfunction    
