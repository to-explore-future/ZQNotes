//
//  main.c
//  二级指针
//
//  Created by to-explore-future on 17/9/28.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 2000;
    int *a = &i;
    int **b = &a;
    printf("%d\n",i);
    printf("%d\n",*a);
    printf("%d\n",**b);
    return 0;
}
