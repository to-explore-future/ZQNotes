//
//  main.c
//  宏
//
//  Created by to-explore-future on 17/10/12.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>
#define M 10
#define M1 y*y-2*y
#define M2(a) a+a*a
#define M3(a,b) a*b
#define MAX(a,b) a>b?a:b
void 宏(){
    //`宏替换`：源程序编译之前，会对我们写的源代码进行处理，
    //会把源代码中所有出现`宏名`的地方，一律使用`宏的字符串`去替换。`并没有添加括号`
    int y = 3;
    int result = 3*M1 +2*M1 - 50;
    //正确的解析： 3*y*y-2*y + 2*y*y-2*y - 50；
    //           27 - 6 + 18 - 6 -50;
    // -11
    printf("result = %d \n",result);
}

void 有参宏(){
    int result = M2(3);
    printf("result = %d \n",result);
    
    int result2 = M3(4, 5);
    printf("result = %d \n",result2);
    
    //有参宏最好要带着括号
    //#define M4(a,b) (a)*(b)+(a)-(b)
    //#define M4(a,b) a*b + a-b
    //这两种的结果可能是不以样的 由于宏的预处理 逻辑：不带括号 替代
    //所以不括号的容易出现 与我们认为的不一样的结果
}

void 有参宏求最大值(){
    printf("最大值 = %d \n",MAX(20,40));
}

int main(int argc, const char * argv[]) {
    有参宏求最大值();
    宏();
    有参宏();
    return 0;
}
