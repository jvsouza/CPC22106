//
// Project  Method to display the truncation error Example
// File     truncationERROR.sci
// Author   Jonas Vieira de Souza
// Created  2016-12-05
// Modified 2016-12-05
// Version  1.0
// Purpose:
//

function cpc_truncationERROR(passo)
    g = 9.80665;    m = 60; c = 0.25;   i = 1;
    t(1)=0; vex(1)=0;   vnum(1)=0;  dt=0.5;

    while t(i) < passo do
        t(i+1)      = t(i) + dt;
        vex(i+1)    = sqrt((g*m)/c)*tanh(sqrt((g*c)/m)*t(i+1));
        vnum(i+1)   = vnum(i) + (g-(c/m)*(vnum(i))^2) * dt;
        i = i + 1;
    end

    printf("Solução exata \t\t= %f;\n", vex(i) );
    printf("Solução numérica \t= %f;\n", vnum(i) );
    e = abs((vex(i)-vnum(i))/vex(i))*100;
    printf("ErroPercentualRelativo\t= %f%%;\n", e);

    plot2d(t,vex,  style=[color('blue4')]);
    plot2d(t,vnum, style=[color('red4')]);
    xgrid;
    xtitle('Truncation ERROR: bungee Jumping');
endfunction
