//
//  main.c
//  两个数交换
//
//  Created by to-explore-future on 17/9/28.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
void swep1(int *a,int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}
int main(int argc, const char * argv[]) {
    int a = 10,b = 20;
    printf("交换前：a = %d,b = %d\n",a,b);
    swep1(&a, &b);
    printf("交换后：a = %d,b = %d\n",a,b);

    return 0;
}
