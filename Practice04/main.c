//
//  main.c
//  Practice04
//
//  Created by 綦 on 16/11/28.
//  Copyright © 2016年 PowesunHolding. All rights reserved.
//

#include <stdio.h>

int max_list(int count, ...);
int main(int argc, const char * argv[]) {
    printf("1，2，3，4，5，3，6，5，2中最大的数是：%i\n",max_list(9, 1, 2, 3, 4, 5, 3, 6, 5, 2));
    
    return 0;
}
int ascii_to_integer(char *string)
{
    int intValue = 0;
    for (int index = 0; *(string + index) != '\0'; index++) {
        char ch = *(string + index);
        if (ch >= '0' && ch <= '9') {
            intValue = intValue*10 + (ch - '0');
        }
        else
        {
            return 0;
        }
    }
    
    return intValue;
}
