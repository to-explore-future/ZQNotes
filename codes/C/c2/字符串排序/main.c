//
//  main.c
//  字符串排序
//
//  Created by to-explore-future on 17/9/30.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#include <string.h>
int main(int argc, const char * argv[]) {
    
    char *p[] = {"ajafj","unurnvu","pnvuufn","aunu","jijjkj"};
    for (int i = 0 ; i < 5; i++) {
        printf("%s \t",p[i]);
    }
    printf("\n");
    int len = 5;
    char *temp;
    for (int i = 0; i < len - 1; i++) {
        for (int j = 0 ; j < len - 1 - i; j++) {
            if(strcmp(p[j], p[j+1]) > 0){
                temp = p[j];
                p[j] = p[j+1];
                p[j+1] =temp;
            }
        }
    }
     printf("\n");
    for (int i = 0 ; i < 5; i++) {
        printf("%s \t",p[i]);
    }
    printf("\n");printf("\n");
    return 0;
}
