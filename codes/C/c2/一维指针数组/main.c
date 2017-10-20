//
//  main.c
//  一维指针数组
//
//  Created by to-explore-future on 17/9/29.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int a = 3 , b = 4, c = 5;
    int *pa[3] = {&a,&b,&c};
    
    //打印指针数组的第一个元素
    printf("    &a = %p \n",&a);
    printf(" pa[0] = %p \n",pa[0]);
    
    //指针数组名称和指针数组的第一个元素的首地址是一样的
    printf("    pa = %p \n",pa);
    printf("&pa[0] = %p \n",&pa[0]);
    
    //访问a的值
    printf("*pa[0] = %d \n",*pa[0]);
    printf(" *(&a) = %d \n",*(&a));
    printf("  **pa = %d \n",**pa);
    //总结：* 后面无非就是数组名称或者变量名称
    //如果是数组名称，数组名称就是一个地址，直接去访问
    //如果是变量名称，先取出变量值（变量值是地址），去访问变量值所对应的内存空间
    
    int x[2][2] = {1,2,3,5};
    int *pa1[2] = {x[0],x[1]};//这种索引也是地址值
    //x[0]:表示二维数组的第一行，是个地址值，默认是第一行的第一个元素的首地址，及x[0][0]的地址。
    printf("    **pa1 = %d \n",**pa1);
    printf("**(pa1+1) = %d \n",**(pa1 + 1));
    return 0;
}
