//
//  main.c
//  获取星期
//
//  Created by to-explore-future on 17/9/30.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

char *getDay(int day){
    char * days[] = {
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday",
    };
    return day < 8 && day > 0 ? days[day - 1] : "输入出错";
}

int main(int argc, const char * argv[]) {

    printf("%s \n",getDay(6));
    return 0;
}
