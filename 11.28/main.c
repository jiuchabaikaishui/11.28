//
//  main.c
//  11.28
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

float average(int n_values, ...);
int main(int argc, const char * argv[]) {
    printf("%f\n", average(20, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20));
    
    return 0;
}

float average(int n_values, ...)
{
    va_list var_arg;
    int count;
    float sum;
    
    va_start(var_arg, n_values);
    
    for (count = 0; count < n_values; count++) {
        sum += va_arg(var_arg, int );
    }
    
    va_end(var_arg);
    
    return sum/n_values;
}
