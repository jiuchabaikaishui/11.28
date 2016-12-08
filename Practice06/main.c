//
//  main.c
//  Practice06
//
//  Created by 綦 on 16/12/8.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void written_amount(unsigned int amount, char *buffer);
int main(int argc, const char * argv[]) {
    printf("请输入一个正整数：");
    unsigned int amount = 0;
    char buffer[1000];
    scanf("%i", &amount);
    written_amount(amount, buffer);
    printf("%s\n", buffer);
    
    return 0;
}

void written_amount(unsigned int amount, char *buffer)
{
    const char *numberChars = "零壹贰叁肆伍陆柒捌玖拾";
    
    if (amount > 0) {
        while (amount > 0) {
//            buffer = numberChars[amount%10];
            strncpy(buffer, numberChars, 2);
        }
    }
    else
    {
        strncpy(buffer, numberChars, 2);
//        buffer = *(numberChars);
    }
}
