//
//  main.c
//  结构体数组
//
//  Created by to-explore-future on 17/10/9.
//  Copyright © 2017年 sandishui. All rights reserved.
//

#include <stdio.h>

void easyAddressList(){
    printf("请输入信息 格式：姓名 电话 \n");
    struct Student {
        char name[20];
        char phone[12];
    };
    
    struct Student stu[3] ;
    //连续输入两个字符串 用" "表示
    for (int i = 0 ; i < 3; i++) {
        scanf("%s %s",stu[i].name,stu[i].phone);
    }
    
    for (int i = 0 ; i < 3; i++) {
        printf("姓名：%s 电话：%s \n",stu[i].name,stu[i].phone);
    }
}

void 结构体指针访问成员值(){
    struct Student{
        char name[10];
        int age;
    };
    struct Student stu = {"张三",20};
    struct Student *p = &stu;
    printf("姓名：%s,年龄:%d \n",(*p).name,(*p).age);
    //p是一个结构体指针的时候才可以这么写
    printf("姓名:%s,年龄:%d \n",p->name,p->age);
}

void 结构体嵌套使用(){
    
    struct Data{
        int year;
        int month;
        int day;
    };
    
    struct Student{
        char name[10];
        int age;
        float score;
        struct Data birthday;
    };
    
    struct Student stu = {"张三丰",20,59.99,{2000,12,12}};
    // %02d：表示int类型两位有效位， %.02f表示float类型小数部分两位有效位
    printf("姓名：%s,年龄:%d,分数：%.02f,(生日：%d-%02d-%02d \n)",stu.name,stu.age,stu.score,stu.birthday.year,stu.birthday.month,stu.birthday.day);
}

void 结构体嵌套的复杂使用(){
    struct Person{
        char *name;
        int age;
        struct Person *child;//结构体嵌套自己的指针
    };
    
    struct Person kimi = {"kim",8,NULL};
    
    struct Person lin = {"林志颖",45,&kimi};
    
    printf("%s的儿子是%s，儿子今年%d岁了",lin.name,lin.child->name,lin.child->age);
}


int main(int argc, const char * argv[]) {
    结构体嵌套的复杂使用();
    //结构体嵌套使用();
   // 结构体指针访问成员值();
    
   // easyAddressList();
    
    //1.定义结构体的同时定义数组
    struct Student{
        int age;
        char *name;
        float score;
    }stu[5];
    
    //2.先定义结构体后定义数组
    struct Student boy[5];
    
    return 0;
}
