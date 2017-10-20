//
//  main.c
//  Array
//
//  Created by to-explore-future on 17/9/27.
//  Copyright © 2017年 sandishui. All rights reserved.
//  练习二维数组

#include <stdio.h>

void show(int array[3][3]) {
  for (int x = 0; x < 3; x++) {
        for (int y = 0 ; y < 3 ; y++) {
            printf("%d \t",array[x][y]);
        }
    }
    
    printf("\n");
}
//用户输入两个数m，n  生成一个m行n列的数组
void test(){
    int m,n;
    printf("请输入两个数");
    scanf("%d,%d",&m,&n);
    int a [m][n];
    show(a);
}

int main(int argc, const char * argv[]) {
    int a[3][3] = {{1,2,3},{1,2,3},{1,2,3}};
    int b[3][3] = {1,2,3,1,3,2,1,3,2};
    int c[][3] ={1,2,3,1,3,2,1,3,2};
    int d[3][3] = {};
    int e[3][3] = {3,4};

    show(a);
    
    show(b);
    
    show(c);
    
    show(d);
   
    show(e);
    
    test();
    return 0;
}
