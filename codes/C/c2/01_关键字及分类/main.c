//
//  main.c
//  01_关键字及分类
//
//  Created by to-explore-future on 17/9/25.
//  Copyright © 2017年 sandishui. All rights reserved.
//

 

#include <stdio.h>

int main(int argc, const char * argv[]) {
    char direction;
    int flag = 1;
    printf("请输入方向\n");
    while (flag) {
        /*
         * scanf 这个方法能够获取到用户的输入，&direction 你给他一个地址，
         * 他就会把 用户的输入赋值到这个地址
         */
        scanf("%c",&direction);
        switch (direction) {
            case 'w':
            case 'W':
                printf("上\n");
                break;
                
            case 's':
            case 'S':
                printf("下\n");
                break;
            case 'A':
            case 'a':
                printf("左\n");
                break;
            case 'd':
            case 'D':
                printf("右\n");
                break;
            case 'q':
            case 'Q':
                printf("正在退出\n");
                flag = 0;
                break;
                
                
            default:
                break;
        }
    }
    
    printf("已经退出\n");
    return 0;
}



