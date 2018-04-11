//
//  ViewController.m
//  关于block
//
//  Created by sharingmobile on 2018/4/10.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

//声明并赋值一个block变量 --> 注意这是声明了一个变量
int (^addBlock)(int , int ) = ^(int x ,int y){
    return  x + y;
}; // -->变量声明完要加 ;

//声明并赋值一个block变量
int (^ cBlock)(int,int) = ^(int x,int y){
    return x + y;
};

//使用typedef定义Block类型
typedef int (^MyBlock)(int ,int);

//声明并赋值一个Block变量
MyBlock addBlock1 = ^(int x,int y){
    return x + y;
};


- (void)viewDidLoad {
    [super viewDidLoad];
    //常规block
    [self test1];
    //使用typedef定义
    [self test2];
    
    //把声明的block 作为参数调用
    userBlockForC(addBlock);
    //直接声明一个block作为一个函数的参数
    userBlockForC(^int(int a, int b) {
        return  a - b;
    });
    
    [self useBlockForOC:cBlock];
    [self useBlockForOC:^(int a,int b){
        return  a * b;
    }];
    
    //使用typedef定义block
    [self useBlockForOC1:addBlock1];
    [self useBlockForOC1:^(int a, int b){
        return a - b;
    }];
    
    //block中可以访问局部变量
    [self blockLocalVaribal];
}

- (void)test1 {
    //1.block代码块的声明 ,参数名称可以带着,也可以不带
    // Block变量的声明格式为: 返回值类型(^Block名字)(参数列表);
    void (^block1)(NSString * a,NSString * b);
//    void (^block2)(NSString *,NSString *);
    
    //2.block 赋值
    block1 = ^(NSString * a ,NSString * b){
        NSLog(@"测试 = %@----%@",a,b);
    };
    //调用block
    block1(@"阿斯顿发",@"水电费第三方");
}

- (void)test2 {
    //定义block1类型
    typedef void (^block1)();
    //给block1类型的 变量hello 赋值
    block1 hello = ^(){
        NSLog(@"hello");
    };
    hello();
    
    fragment * adf;
}

//block作为函数参数

//block作为c函数参数
//这个方法定义的block 只是说明了block的返回值类型 block的名称 block的参数 但是并没有说明 block是怎么运算的
//所以再调用这个方法的时候要传入一个 定义了 怎样运算的的block
void userBlockForC(  int (^aBlock) (int a,int b)  ) {
    NSLog(@"block作为c函数参数 --> result = %d \n",aBlock(300,200));
}

//block作为oc的函数参数
- (void)useBlockForOC:( int (^)(int,int) ) aBlock{
    NSLog(@"block作为oc的函数参数 --> result = %d",aBlock(300,200));
}

//定义一个形参为Block的OC函数1
- (void)useBlockForOC1:(MyBlock)block{
    NSLog(@"定义一个形参为Block的OC函数1 --> result = %d",block(300,200));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)blockLocalVaribal{
    int local = 100;
    void (^myBlock)(void) = ^{
        NSLog(@"global = %d",local);
    };
    local = 200;
    myBlock();
}

@end
