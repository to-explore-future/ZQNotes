//
//  main.c
//  static#extern
//
//  Created by to-explore-future on 17/10/13.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

void test(){
    int num = 1;
    num++;
    printf("num = %d \n",num);
}

void test2(){
    //static 的作用
    // 1):static 修饰之后 作用域得到延长：代码放到了静态区
    // 2):代码只执行一次
    static int num = 2;
    num++;
    printf("num = %d \n",num);
}

int main(int argc, const char * argv[]) {
    test();
    test();
    test();
    
    printf("--------------------- \n");
    
    test2();
    test2();
    test2();
    
    return 0;
}
