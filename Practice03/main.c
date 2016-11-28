//
//  main.c
//  Practice03
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>


int ascii_to_integer(char *string);
int main(int argc, const char * argv[]) {
    printf("请输入一个数字字符串：\n");
    char chars[1000];
    scanf("%s", chars);
    printf("此数为：%i\n", ascii_to_integer(chars));
    
    return 0;
}
int max_list(int count, ...)
{
    int max = 0;
    va_list var_arg;
    
    va_start(var_arg, count);
    
    for (int i = 0; i < count; i++) {
        int value = va_arg(var_arg, int);
        max = max > value ? max : value;
    }
    
    return max;
}
