//
//  main.c
//  Practice01
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

int H(int n, int x);
int main(int argc, const char * argv[]) {
    printf("厄密多项式H(3, 2)：%i\n", H(3, 2));
    
    return 0;
}
int H(int n, int x)
{
    if (n <= 0) {
        return 1;
    }
    else if (n == 1) {
        return 2*x;
    }
    else
    {
        return 2*x*H(n - 1, x) - 2*(n - 1)*H(n - 2, x);
    }
}
