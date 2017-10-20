//
//  main.c
//  使用指针对数组进行逆序
//
//  Created by to-explore-future on 17/9/29.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

void show(int a[],int len ){
    for (int i = 0; i < len; i++) {
        printf("%d\t",a[i]);
    }
    printf("\n");
}

void nixuArray(int arr[] ,int len){
    int *p = arr;
    int i = 0;
    int j = len - 1;
    while (i < j) {
        //逆序
        int temp = *(p+i);
        *(p+i) = *(p + j);
        *(p+j) = temp;
        i++,j--;
    }
}

int main(int argc, const char * argv[]) {
    int a[10] = {1,2,3,4,5,6,7,8,9,10};
    show(a,10);
    //逆序数组
    nixuArray(a, 10);
    show(a, 10);
    
    return 0;
}
