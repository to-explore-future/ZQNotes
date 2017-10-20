//
//  main.c
//  数组指针遍历数组
//
//  Created by to-explore-future on 17/9/28.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int a [10] = {1,2,3,4,5,6,7,8,9,10};
   // int *p = &a[0];
    
    int *p = a;//数组a的地址就是&a[0]的地址，虽然类型不匹配，但是这么写是没有问题的
    int (*aa)[10] = &a;//这种代表数组类型的指针，
    int len = sizeof(a) / sizeof(int);
    for (int i = 0; i < len; i++) {
        printf("%d\t",*(p++));
    }
    printf("sizeof(a) = %lu",sizeof(a));
    printf("\n");
    printf("a  = %p \n",a);
    printf("&a = %p \n",&a);
    printf("a  = %p \n",a + 1);
    printf("&a = %p \n",&a +1);
    return 0;
}
