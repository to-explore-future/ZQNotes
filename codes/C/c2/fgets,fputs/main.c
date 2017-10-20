//
//  main.c
//  fgets,fputs
//
//  Created by to-explore-future on 17/9/30.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#include <string.h>
int main(int argc, const char * argv[]) {
    char ch[10];
    //从输入缓冲区读取一个字符串保存到数组中
    //当输入的字符串的长度超过数组的长度的时候，此时 fgets会自动个数组的最后一个元素变成 '\0'
    //当输入的字符串的长度小于数组的长度的时候，在保证有地方存储 '\0'的情况下，如果还有
    //多余的空间，就在字符串的末尾存一个 '\n''\0' 优先存储 '\0'
    fgets(ch, sizeof(ch), stdin);
    
    
    //去掉 回车符
    // strlen() 获取字符串的长度的时候 不会计算 '\0'
    if(ch[strlen(ch) - 1]== '\n'){
        ch[strlen(ch) - 1] = '\0';
    }
    
    
    //printf("%s \n",ch);
    for (int i = 0 ; i< sizeof(ch); i++) {
        printf("%d \t",ch[i]);
    }
    printf("\n");
    return 0;
}
