//
//  main.c
//  常见的内存分配函数
//
//  Created by to-explore-future on 17/9/30.
//  Copyright © 2017年 sandishui. All rights reserved.
//

void aboutRealloc(){
    int *p = (int *)malloc(4*sizeof(int));
    //如果malloc申请的空间，不够用了，不丢失数据的情况下，扩大空间，
    //这个时候使用realloc
    //realloc，会到内存中去查看，看看在原来的空间的基础上，还有没有
    //足够的连续的空间满足新的需求
    //如果有 就接着接着原来的内存空间再往下申请一块，返回原来的指针
    //如果没有，就会 去寻找一块满足需求的 连续的内存空间，把原来的数据拷贝过去（数据不会丢失），
    //返回新空间的指针。
    
    p = realloc(p, 40*sizeof(int));
    *(p+39) = 1;
    printf("%d \n",*(p+39));
}

#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char * argv[]) {
    
    aboutRealloc();
    
    //如果内存申请成功，系统就会返回 这块内存空间的首地址
    //如果不成功，就会返回 NULL
    int *p = (int *)malloc(4*sizeof(int));
    if(p != NULL){
        //给这块内存空间 赋值
//        *p = 10;
//        *(p+1)= 100;
//        *(p+2) = 1000;
//        *(p+3) = 10000;
//        
        //使用memset函数给malloc申请的控件进行初始化
        memset(p,'a',16);
        //查看
        for (int i = 0; i < 4; i++) {
            printf("%c \t",*(p+i));
        }
    }else if(p == NULL){
        //
        printf("\n %s","申请失败");

    }
    return 0;
}
