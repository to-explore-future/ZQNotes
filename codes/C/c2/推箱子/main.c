//
//  main.c
//  推箱子
//
//  Created by to-explore-future on 17/9/29.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#define row 10
#define line 11

/*
 *  打印地图
 */
void show(char map[row][line]){
    for (int i = 0 ; i < row; i++) {
        printf("%s \n",map[i]);
    }
}

/*
 *  获取用户的下一步
 */
char getNextStep(char map[row][line],int pNextX,int pNextY){
    
    //一定要注意 x ，y的对应关系
    return map[pNextY][pNextX];
}

/*
 * 走路
 */
void swop(char map[row][line],int pX,int pY,int pNextX,int pNextY){
    char temp = map[pY][pX];
    map[pY][pX] = map[pNextY][pNextX];
    map[pNextY][pNextX] = temp;
}

/*
 *  获取箱子的预判
 */
char getBoxNext(char map[row][line],int bNextX,int bNextY){
    
    return map[bNextY][bNextX];
}

int main(int argc, const char * argv[]) {
    //1.定义地图:line为什么要是11呢，字符串最后一位是 ‘\0’
    char map[row][line] = {
        "##########",
        "#O ####  #",
        "# X####  #",
        "#        #",
        "######   #",
        "#   ###  #",
        "#        #",
        "#   ######",
        "#         ",
        "##########",
        
    };
    //2.打印地图
    show(map);
    //3.提示用户游戏规则
    printf("请输入方向键 w.向上 s.向下 a.向左 d.向右 q.退出");
    char direction;//用户输入方向
    
    int pX = 1;//当前的x坐标
    int pY = 1;//当前的y坐标
    int pNextX = 1;//下一步的x坐标
    int pNextY = 1;//下一步的y坐标
    
    int bX = 2;
    int bY = 2;
    int bNextX = 2;
    int bNextY = 2;
    
    while (1) {
        //用户开始输入 开始接收用户的输入
        scanf("%c",&direction);
        switch (direction) {
            case 'w':
            case 'W':
                pNextY--;
                bNextY--;
                break;
            case 's':
            case 'S':
                pNextY++;
                bNextY++;
                break;
            case 'a':
            case 'A':
                pNextX--;
                bNextX--;
                break;
            case 'd':
            case 'D':
                pNextX++;
                bNextX++;
                break;
                
            case 'q':
            case 'Q':
                break;
                
            default:
                break;
        }
        
        //以上四种 及时代表用户的下一步操作
        //用户按w的时候无非就是三种情况
        //1.撞到箱子
        //2.撞到墙
        //3.遇到路
        //以上中情况 走完之后 都会提前知道 用户的下一步的计划
        //那么就判断一下 下一步在地图中是什么
        char nextStep = getNextStep(map,pNextX,pNextY);
        if(nextStep == ' '){//3.遇到路
            //和路进行交换
            swop(map,pX,pY,pNextX,pNextY);
        
            //互换成功 保存小人的位置
            pX = pNextX;
            pY = pNextY;
            //但是你对箱子进行了预判 这个时候撤销对箱子的预判
            switch (direction) {
                case 'w':
                case 'W':
                    bNextY++;
                    break;
                case 's':
                case 'S':
                    
                    bNextY--;
                    break;
                case 'a':
                case 'A':
                    
                    bNextX++;
                    break;
                case 'd':
                case 'D':
                    
                    bNextX--;
                    break;
                    
                default:
                    break;
            }
        }else if(nextStep == 'X'){//1.撞到箱子
            //两种情况
            //初始化箱子的位置
            //既然小人的动作可以预判 那么箱子同样的 套路
            char boxNext = getBoxNext(map,bNextX,bNextY);
            //1.箱子后面是路
            if(boxNext == ' '){
                //是路 就交换
                //1.箱子和路交换
                swop(map, bX, bY, bNextX, bNextY);
                //2.小人和路交换
                swop(map, pX, pY, pNextX, pNextY);
                //交换完毕之后 更新小人和箱子的位置
                bX = bNextX;
                bY = bNextY;
                pX = pNextX;
                pY = pNextY;
                
            }else if(boxNext =='#'){
                //是墙 就撤销预判
                switch (direction) {
                    case 'w':
                    case 'W':
                        pNextY++;
                        bNextY++;
                        break;
                    case 's':
                    case 'S':
                        pNextY--;
                        bNextY--;
                        break;
                    case 'a':
                    case 'A':
                        pNextX++;
                        bNextX++;
                        break;
                    case 'd':
                    case 'D':
                        pNextX--;
                        bNextX--;
                        break;
                        
                    default:
                        break;
                }

            }
            //2.箱子后面是墙
        }else if(nextStep == '#'){//2.撞到墙
            //如果撞到墙，说明用户操作不成功
            //把对用户的预判撤回
            switch (direction) {
                case 'w':
                case 'W':
                    pNextY++;
                    bNextY++;
                    break;
                case 's':
                case 'S':
                    pNextY--;
                    bNextY--;
                    break;
                case 'a':
                case 'A':
                    pNextX++;
                    bNextX++;
                    break;
                case 'd':
                case 'D':
                    pNextX--;
                    bNextX--;
                    break;
                    
                default:
                    break;
            }
        }
        
        show(map);
    }
    

    return 0;
}
