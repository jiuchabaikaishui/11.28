//
//  main.c
//  Practice02
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>


int gcd(int M, int N);
int main(int argc, const char * argv[]) {
    printf("%i和%i的最大公约数是：%i\n", 32, 16, gcd(32, 16));
    
    return 0;
}
int gcd(int M, int N)
{
    if (M <= 0 || N <= 0) {
        return 0;
    }
    
    int max = M > N ? M : N;
    int min = M < N ? M : N;
    int remainder = max%min;
    if (remainder == 0) {
        return min;
    }
    else
    {
        return gcd(min, remainder);
    }
}
