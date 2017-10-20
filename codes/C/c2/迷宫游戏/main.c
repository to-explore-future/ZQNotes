//
//  main.c
//  迷宫游戏
//
//  Created by to-explore-future on 17/9/27.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#define line 6
#define row 6
void showMap(char a[row][line]){
    for (int x = 0; x < row; x++) {
        for (int y = 0; y < line; y++) {
            printf("%c",a[x][y]);
        }
        printf("\n");
    }
}


int main(int argc, const char * argv[]) {
    char a[row][line] = {
        '#','O','#','#','#','#',
        '#',' ','#','#',' ',' ',
        '#',' ','#','#',' ','#',
        '#',' ','#','#',' ','#',
        '#',' ',' ',' ',' ','#',
        '#','#','#','#','#','#'
    };
    showMap(a);
    int currentX = 1;
    int currentY = 0;
    int oldX = 1;
    int oldY = 0;
    printf("控制小人的移动:  w.上  a.左  s.下  d.右  q.退出 \n");
    char direction ;
    while (1) {
        
        scanf("%c",&direction);
        switch (direction) {
            case 'w':
            case 'W':
                //上
                //就是交换位置，把空格换成小人，把小人换成空格
                //每次方向键，都要判断 该不该移动
                //向上就是 y - 1
                if(currentY > 0){
                    //进来之后 如果真的让它移动 ，要移动到的位置 是一个空格吗
                    char stepTo = a[currentY - 1][currentX];
                    if(stepTo == ' '){
                        currentY -= 1;
                        
                        
                        //确定可以走 之后 就对数组 指定位置的进行更改
                        char temp = a[oldY][currentX]; // 原来的位置
                        a[oldY][currentX] = a[currentY][currentX];
                        a[currentY][currentX] = temp;
                        
                        //互换成功之后呢， x 和 Y 重新初始化
                        oldY = currentY;
                        showMap(a);
                    }else{
                        printf("撞墙了\n");
                    }
                }else{
                    //提示用户不能走
                    printf("不能往上走!\n");
                    
                }
                
                break;
            case 's':
            case 'S':
                //下
                //首先判断 y + 1 会不会越界
                if(currentY + 1 > row){
                    //会不会超出地图
                    printf("不能再往下走了！\n");
                }else{
                    //会不会撞墙
                    char stepTo = a[currentY + 1][currentX];
                    if(stepTo == '#'){
                        printf("撞墙了欧！\n");
                    }else{
                        //剩下的情况就是 可以往下移动啊
                        currentY += 1;
                        char temp = a[currentY][currentX];
                        a[currentY][currentX] = a[oldY][currentX];
                        a[oldY][currentX] = temp;
                        
                        //交换完成之后呢 更新 xy
                        oldY = currentY;
                        showMap(a);
                    }
                }
               
                break;
            case 'a':
            case 'A':
                //向左
                //首先判断会不会超越地图
                if(currentX > 0){
                    //判断会不会撞墙
                    char stepTo = a[currentY][currentX -1];
                    if(stepTo == '#'){
                        printf("撞墙了！\n");
                    }else{
                        //如果不撞墙 就交换
                        currentX -= 1;
                        char temp = a[currentY][currentX];
                        a[currentY][currentX] = a[currentY][oldX];
                        a[currentY][oldX] = temp;
                        
                        //交换完成之后 更新数据
                        oldX = currentX;
                        showMap(a);
                    }
                }else{
                    printf("不能往左走！\n");
                }
                break;
            case 'd':
            case 'D':
                //向右移动
                //首先判断会不会撞墙
                if(currentX +1 >= line){
                    printf("不能往右走！！\n");
                    
                }else{
                    //判断会不会撞墙
                    char stepTo = a[currentY][currentX +1];
                    if(stepTo == '#'){
                        printf("撞墙了！！\n");
                       // printf("currentX：%d",currentX);
                    }else{
                        //交换
                        currentX += 1;
                        char temp = a[currentY][currentX];
                        a[currentY][currentX] = a[currentY][oldX];
                        a[currentY][oldX] = temp;
                        
                        //更新位置
                        oldX = currentX;
                        showMap(a);
                    }
                }
                break;
            case 'q':
            case 'Q':
                //退出
                break;
                
            default:
                break;
        }
    }
    return 0;
}
