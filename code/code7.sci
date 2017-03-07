//
// Project  Metthod to expand Taylor Example
// File     expandTaulor.sci
// Author   Jonas Vieira de Souza
// Created  2017-02-24
// Modified 2017-02-24
// Version  1.0
// Purpose:
//

clear;
clc;

x0 = %pi/4;
x1 = %pi/3;

h = (x1 - x0);
vreal = cos(x1);
fx = cos(x0);
i = 0; // 0 a 6
j = 0; // contador para selecionar derivada

while i <= 6 do
    e = abs ((vreal-fx)/vreal) * 100;
    printf("Ordem %d, f(x1) = %.10f, erro = %.2e\n", i, fx, e);
    j = j + 1;
    i = i + 1;
    if j == 1 then
        der = -sin(x0);
    elseif j == 2 then
        der = -cos(x0);
    elseif j == 3 then
        der = sin(x0);
    else
        der = cos(x0);
        j = 0;
    end

    fx = fx + (der*(h^i)) / factorial(i);
end









//while t(i) < 12 do
//    t(i+1) = t(i) + dt;
//    vex(i+1) = sqrt(g * m/c) * tanh(sqrt(g * c/m) * t(i+1));
//    vnum(i+1) = vnum(i) + (g - (c/m) * (vnum(i))^2) * dt;
//    i = i + 1;
//end
//
//printf("A solução exata de v(%d) = %f\n", t(i), vex(i));
//printf("A solução numérica de v(%d) = %f\n", t(i), vnum(i));
//
//e = abs((vex(i) - vnum(i))/vex(i)) * 100;
//
//
//printf("O erro percentual relativo verdadeiro vale %f%%\n", e);
//
//plot2d(t, vex, style = [color('blue4')]);
//plot2d(t, vnum, style = [color('red4')]);
//xlabel("t(s)");
//ylabel("v(t) (m/s)");
//xgrid;
