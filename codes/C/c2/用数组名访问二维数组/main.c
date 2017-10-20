//
//  main.c
//  用数组名访问二维数组
//
//  Created by to-explore-future on 17/9/29.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {

    int a[4][4] = {{1,3,5,7},{2,4,6,8},{9,11,13,15},{10,12,14,16}};
    
    for (int i = 0 ; i < 4; i++) {
        for (int j = 0 ; j < 4 ; j ++ ) {
           // printf("%d \t",*(a[i] + j));
            //数组名指向的是数组中第一个元素的首地址，意义：针对元素
            //a 指向的是a这个二维数组中第一个元素（第一个一维数组）的首地址，意义：针对这个一维数组：+1 / -1 移动一维数组的长度
            printf("%d \t",*(*(a +i) + j));
            // a + i :
            // a[0]+j: 指针移动的距离不同。
        }
        printf("\n");
    }
    return 0;
}
