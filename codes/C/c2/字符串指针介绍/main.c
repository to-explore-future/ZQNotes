//
//  main.c
//  字符串指针介绍
//
//  Created by to-explore-future on 17/9/30.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
int main(int argc, const char * argv[]) {
    
    
    
    
    
    //二维字符串数组
    char ss[3][5] = {"abcd","bcf","a"};
    //或者
    char sb[][5] = {"abcd","sss","add"};
    for (int i = 0; i < 3; i++) {
        printf("%s \t",ss[i]);
         printf("%s \t",*(ss+i));
    }
    
    char *p =NULL;
    p = malloc(100);//申请100个字节的空间
    scanf("\n %s",p);
    printf("%s \n",p);
    
    
    return 0;
}
