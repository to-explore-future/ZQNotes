//
//  main.c
//  单词个数 ，首字母大写
//
//  Created by to-explore-future on 17/9/28.
//  Copyright © 2017年 sandishui. All rights reserved.
//



#include <stdio.h>
#include <string.h>

// 随便输入一个字符串 区分这里面有几个单词，并且把每个单词的首字母 变成大写
void test(){
    puts("请输入一段英文，可以有空格");
    char arr[100] = {};//各一个字符数组 不指定长度
    gets(arr);
    // 思路：循环这个字符数组，拿到每个字符，与 ‘ ’ 进行比较，
    // 如果是 ‘ ‘ 就搞一个标记 标记是 ' '
    //
    int count = 0; //单词的数量
    int isWord = 0;//是否是单词
    
    for (int i = 0 ; arr[i]!= '\0'; i++) {
        if(arr[i] == ' '){ //如果是 ’ ‘ 就说明不是单词，如果连续遇到 也没有关系
            isWord=0;
        }else if(isWord == 0){
            //这个时候说明 开始是单词的部分了
            // 1.首字母变成大写
            arr[i] = arr[i] - 32; //26个英文字母，但是大小写之间多了几个字符，
            isWord = 1;
        }
    }
    
    printf("result:%s",arr);
    
}

int main(int argc, const char * argv[]) {
    test();
    printf("\nHello, World!\n");
    return 0;
}
