//
//  SortTest.c
//  c2
//
//  Created by to-explore-future on 17/9/27.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include "SortTest.h"

//这个里面写什么方法呢，就到 *.h中声明这个方法
//如果在哪里使用这个方法，就 #include “*.h”
//就是这种逻辑，至于为什么 ？？？

int a [10] = {100,50,23,93,10,3,5,27,39,300};
int len  = 10;

void show(void) {
  for (int i = 0; i < len; i++) {
        printf("%d ", a[i] );
    }
}

void bubbleSort(){
    show();
    printf("进行排序\n");
    for (int j = 0; j < len -1; j++) {
        for (int x = 0; x < len - j - 1; x ++) {
            int m= 0;
            if(a[x] > a[x + 1]){
                m  =  a[x];
                a[x] = a[x + 1];
                a[x +1] = m;
            }
        }
    }
    printf("完成排序\n");
    for (int i = 0; i < len; i++) {
        printf("%d ", a[i] );
    }
}


/**
 * SelectionSort:每次选择一个最小的数 放在最左边,或者最右边
 */
void SelectionSort(){
    
}
