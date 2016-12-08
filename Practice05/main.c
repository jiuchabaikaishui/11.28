//
//  main.c
//  Practice05
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>
#include <stdarg.h>

void print_value(char *string, ...);
int main(int argc, const char * argv[]) {
    print_value("小明，%s，你今年%d岁啦，这是%f元钱，你自己买东西吃吧，这是字母%c.\n", "你好", 10, 8.2, 'A');
    
    return 0;
}

void print_integer(int x)
{
    printf("%d", x);
}
void print_float(float x)
{
    printf("%f", x);
}
void print_string(char *string)
{
    for (int count = 0; *(string + count) != '\0'; count++) {
        putchar(*(string + count));
    }
}
void print_value(char *string, ...)
{
    va_list var_arg;
    va_start(var_arg, string);
    for (int index = 0; *(string + index) != '\0'; index++) {
        if (*(string + index) == '%') {
            if (*(string + index + 1) == 'd') {
                int value = va_arg(var_arg, int);
                print_integer(value);
                index++;
            }
            else if (*(string + index + 1) == 'f')
            {
                float value = va_arg(var_arg, double);
                print_float(value);
                index++;
            }
            else if (*(string + index + 1) == 's')
            {
                char *value = va_arg(var_arg, char *);
                print_string(value);
                index++;
            }
            else if (*(string + index + 1) == 'c')
            {
                char value = va_arg(var_arg, int);
                putchar(value);
                index++;
            }
            
            va_end(var_arg);
        }
        else
        {
            putchar(*(string + index));
        }
    }
}
