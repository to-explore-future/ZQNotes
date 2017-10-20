//
//  main.c
//  Include
//
//  Created by to-explore-future on 17/9/26.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#include "Calculater.h"
#include "SortTest.h"
#include <float.h>


int main(int argc, const char * argv[]) {
    // #include "a.txt"
    bubbleSort();
    printf("\nint 存储大小 ：%lu \n",sizeof(int));
    printf("float 存储最大字节数 ：%lu \n",sizeof(float));
    printf("float 最小值：%E\n",FLT_MIN);
    printf("float 最大值 ：%E \n ",FLT_MAX);
    printf("精度值： %d \n ",FLT_DIG);
    
    
    
    
    
    return sum(20, 20);
}

