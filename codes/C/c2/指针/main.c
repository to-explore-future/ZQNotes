//
//  main.c
//  指针
//
//  Created by to-explore-future on 17/9/27.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#include <string.h>

void 地址的使用(){
    char str[10] = "abcdefg";
    printf("%s\n",str);
    printf("%s\n",&str[0]);
}
void strs(){
    char str1[100] = "the first str should big enugh";
    char str2[20] = "the second str";
    puts(str1);
    puts(str2);
    strcpy(str1, str2);
    puts(str1);
    puts(str2);
}

int main(int argc, const char * argv[]) {
    // insert code here...
    地址的使用();
    printf("Hello, World!\n");
    strs();
    return 0;
}
