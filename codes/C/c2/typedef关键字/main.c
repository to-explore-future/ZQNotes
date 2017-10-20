//
//  main.c
//  typedef关键字
//
//  Created by to-explore-future on 17/10/12.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

void typedef类型(){
    //typedef就是给数据类型起外号
    int a = 10;
    printf("a = %d \n",a);
    
    typedef int alias;//给int类型起了个别名 alias
    alias b = 30;
    printf("b = %d \n",b);
    
    alias *p = &b;
    printf("*p = %d \n",*p);
};
//固定的用法  记住
void typedef数组(){
    //使用typedef给数组起别名
    typedef int  array[5];
    array a = {1,2,3,4,5},b = {5,4,3,2,1};
    
    for(int i = 0 ; i < 5;i++){
        printf("%d \t",a[i]);
    }
};

void typedef结构体(){
    //给结构体起别名
    struct Person {
        char *name;
        int age;
    };
    struct Person Tom = {"Tom",20};
    printf("name = %s,age = %d \n",Tom.name,Tom.age);
    
    typedef struct Person P;
    P kit = {"kit",30};
    printf("name = %s,age = %d \n",kit.name,kit.age);
    
    //给结构体起别名的另一种写法
    typedef struct Car {
        int speed;
        int wheel;
    }MyCar;
    MyCar car1 = {200,4};
    printf("speed = %d,wheel = %d \n",car1.speed,car1.wheel);
    
    //给匿名的结构体起别名
    typedef struct {
        int speed;
        int wheel;
    }MyNewCar;
    MyNewCar car2 = {200,4};
    printf("speed = %d,wheel = %d \n",car2.speed,car2.wheel);

};

void typedef枚举(){
    //给枚举类型起别名
    //给Sex起个别名 NewSex
    typedef enum Sex {MAN,WOMAN} NewSex;
    //给匿名的枚举 起别名
    typedef enum {WONDAY,TUSEDAY} WeekDay;
    //原始类型 格式
    typedef enum Sex aSex;
    //已有别名 格式
    typedef NewSex bSex;
    bSex b = MAN;
};


int sum(int a ,int b){
    return a + b;
}

int subtract(int a ,int b){
    return a - b;
}

void typedef函数指针(){
    //一个指向 形参是 (int int)格式的函数指针
    int (*p)(int ,int );
    
    p = sum;//p指向了 sum函数
    printf("sum = %d \n",p(23,23));
    
    p = subtract;
    printf("subtract = %d \n",p(23,22));
    
    //开始起个别名 p --> Alias
    typedef int (*Alias)(int ,int );
    //起了别名之后还要再定义一个变量
    Alias a1;
    a1= sum;
    printf("sum = %d \n",a1(23,23));
};


int main(int argc, const char * argv[]) {
    typedef函数指针();
    //typedef结构体();
    //typedef数组();
    //typedef类型();
    return 0;
}
