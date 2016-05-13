//
// Project  Method subtractive cancellation Example
// File     subtractiveCAN.sci
// Author   Jonas Vieira de Souza
// Created  2016-12-05
// Modified 2016-12-05
// Version  1.0
// Purpose: 
//          

function cpc_canSub()
    //    float a, b, c, d, x1, x2;
    a = 1;
    b = 3000.001;
    c = 3;
    d = sqrt(b * b - 4 * a * c);
    x1 = (-b + d) / (2 * a);
    x2 = (-b - d) / (2 * a);
    printf("\nPrecisão simples: \tx1 = %f e x2 = %f", x1, x2);

    //    double aa, bb, cc, dd, x11, x22;
    aa = 1;
    bb = 3000.001;
    cc = 3;
    dd = sqrt(bb * bb - 4 * aa * cc);
    x11 = (-bb + dd) / (2 * aa);
    x22 = (-bb - dd) / (2 * aa);   
    printf("\nPrecisão dupla: \tx1 = %f e x2 = %f", x11, x22);    

    x1r = -2. * c / (b + d);
    printf("\nFórmula modificada para a primeira raiz: x1 = %f", x1r);
endfunction
