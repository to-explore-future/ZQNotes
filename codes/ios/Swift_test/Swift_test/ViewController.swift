//
//  ViewController.swift
//  Swift_test
//
//  Created by sharingmobile on 2018/5/10.
//  Copyright © 2018年 869518570@qq.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello world")
        //类型的声明
        var number = 30
        number = 50;
        let c = number * 2
        print("c = %d",c)
        
        
        //常量的声明 the compiler suggest never used variables should user _ ;
        _ = 30
        let _:Int = 30
        let _:Double = 50
        
        //类型转换:数据类型不会隐士转换,必须要 显示转换
        let lable = "what's your age?"
        let age = 18
        let ageLable = lable + " = " + String(age)
        print(ageLable)
        
        //还有一种个简单的把值变成 String 的方法 注意\的 orientation
        let one = 4
        let two = 5
        print("I have \(one + two) girl friends!")
        
        //关于数组的创建
        var shoppingList = ["catFish","water","tulips","blue paint"]
        shoppingList[1] = "oranger juice"
        print(shoppingList[1])
        
        //这样写就是字典
        var pet = [
            "one" : "大黄",
            "two" : "三牛",
        ]
        print(pet["one"] ?? "not found")
        
        //那么如何创建空的数组或者 字典呢
        var emptyArray = [String]()                 //创建一个String类型的空的数组
        var emptyDictionary = [String:Float]()      //创建一个空的字典
        
        //给数组或者是字典赋值
        emptyArray = []
        emptyDictionary = [:]
        
        print(emptyArray)
        print(emptyDictionary)
        
        //控制流
        let individualScore = [23,45,67,89,100]
        var score = 0
        for score in individualScore {
            if score > 50 {
                print("\(score) > 50")
            }else{
                print("\(score) <= 50")
            }
        }
        
        var optionalStrig :String? = "hello world"
        print(optionalStrig == nil)
        
        //关于整数 你可以指定int的长度  比如:uint8 uint16 uint32 但是你也可以不指定int的长度, 如果你使用Int 那么 编译器默认
        //这个int的长度 和平台的 位数相同, 比如:你使用的32位的系统,那么这个 int的长度就是32位,如果你使用的平台是 64位那么 这个int的长度默认就是 64位
        let minValue = uint.min
        let maxValue = uint.max
        
        print("minValue = \(minValue)")
        print("maxValue = \(maxValue)")
        
        //整数与浮点数的相加  要保持类型一致
        let three = 3;
        let other = 0.14159265
        let pi = Double(three) + other
        
        print(pi)
        
        //boolean 值的使用
        let orangesAreOrange = true
        let turnipsAreDelicious = false
        
        if orangesAreOrange {
            print("orangesAreOrage")
        }else{
            print("Did Oranges have any other colors?")
        }
        if turnipsAreDelicious {
            print("turnipsAreDelicious")
        }else{
            print("turnips is't delicious")
        }
        
        //元组的使用  tuples
        let http404Error = (404,"not Found")  //定义
        //取值
        let (statuCode,statuMessage) = http404Error
        print(statuCode)
        print(statuMessage)
        //also print like this
        print("the statusCode is \(statuCode)")
        print("the statusMessage is \(statuMessage)")
        
        //if you don't need some params in the tuples you can write lick this
        
        let (statusCode,_) = http404Error
        print("statusCode is \(statusCode)")
        
        //every params in the tuples hava a corner mark ,you can use params like this
        print("statusCode is \(http404Error.0)")
        print("statusMessage is \(http404Error.1)")
        
        // when you init tuples you can init with param name, like this
        let aaa = (statusCode:404,statusMessage:"not Found")
        print("statusCode is \(aaa.statusCode) \nstatusMessage is \(aaa.statusMessage)")
        
        //可选类型是怎么回事
        //if possibleNumber can convert to Int , then convertedNumber is 235 ,
        //convertedNumber is a optionals ,
        let possibleNumber = "235"
//        let possibleNumber = "what"
        let convertedNumber = Int(possibleNumber)   //convertedNumber is a optionals ,编译器并不确定这个变量到底是什么类型,
        print("convertedNumber = \(convertedNumber ?? 123)")
        
        var serverRespondCode:Int? = convertedNumber
        print("serverResponsCode = \(serverRespondCode ?? 000)")
        
        if let aNumber = Int(possibleNumber) {
            print("convert success == aNumber --> \(aNumber)")
        }else{
            print("convert failed")
        }
        
        //可选类型转换成功与否 可以作为判断的条件
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

