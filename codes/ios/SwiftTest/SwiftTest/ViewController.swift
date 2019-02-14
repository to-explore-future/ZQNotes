//
//  ViewController.swift
//  SwiftTest
//
//  Created by haoqiao on 2019/2/2.
//  Copyright © 2019 zq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basePart()
        basicOprators()
    }
    
    
    func basicOprators() {
        //求余 余数只跟被除数有关系
        let remainder = 9 % 4
        let remainder1 = 9 % -4
        let remainder2 = -9 % 4
        let remainder3 = -9 % -4
        print("remainder:\(remainder) remainder1:\(remainder1) remainder2:\(remainder2) remainder3:\(remainder3)")
    }
    
    fileprivate func basePart() {
        //各种进制的表示
        let decimalInteger = 17;
        let binaryInteger = 0b10001;
        let octalInteger = 0o21;
        let hexInteger = 0x158fd;
        print("\(decimalInteger),\(binaryInteger),\(octalInteger),\(hexInteger)")
        
        //指数的表示方法
        let num1 = 1.25e3;
        let num2 = 1.25e-2;
        print("num1 = \(num1) , num2 = \(num2)")
        
        //为了增强可读性，数字中间可以添加分隔符
        let easyReadNum = 3000_0000;
        print("easyReadNum = \(easyReadNum)")
        
        //Uint16 和 UInt8 可不是一个类型，其他同理
        let uint16 : UInt16 = 3000;
        let uint8 : UInt8 = 200;
        let plusResult = uint16 + UInt16.init(uint8);
        print("plusResult = \(plusResult)")
        
        //在Java中，运算时如果类型不同，范围小的会自动强转成范围大的类型
        //但是在swift中,不支持自动转换，而且强转的写法要注意：和java正好相反
        let int_a = 3
        let double_b = 3.5
        let result_double = Double(int_a) + double_b;
        print("result_double = \(result_double)")
        
        //别名的使用
        //关于别名的理解：不同的对象在不同的场景，会有不同的名称，不同的意义
        typealias temp = UInt16
        print("UInt16的最大值 = \(temp.max)")
        //就拿一个人来举例：在公司：王总 在家里：老公 在家乡：王小胖 真名：王五
        let wangWu = WangWu()
        typealias bossWang = WangWu
        typealias husband = WangWu
        typealias smallFatWang = WangWu
        
        //布尔值 的使用
        let isChinese = true
        if isChinese {  //这里不用带括号，和java的区别
            print("is Chinese")
        }
        
        //元组：任意类型的一个数组
        let http404Error = (404,"Not Found")
        //元组的使用
        let (errorNumber,errorMessage) = http404Error
        print("errorNumber = \(errorNumber) , errorMessage = \(errorMessage)")
        //如果你只需要元组的一部分值，分解的时候，不用的部分使用 _ 表示,比如
        let (errorNumber1,_) = http404Error
        print("errorNumber1 = \(errorNumber1)")
        //还可以使用下标的方式获取值
        print("errorNubmer1:\(http404Error.0)")
        //定义元组的时候可以带着值得名称，比如
        let http500Error = (errorNumber:500,errorMessage:"server Error")
        print("http500Error  --> errorNumber:\(http500Error.errorNumber) errorMessage:\(http500Error.errorMessage)")
        
        //可选类型:这个有点像kotlin中的 ?
        //convertNumber 可能是Int的值，也可能没有值
        let posibleNumber = "123"
        let convertNumber = Int(posibleNumber)
        print("convertNumber = \(convertNumber ?? 123)")
        
        let posibleNubmer1 = "String"
        let convertNumber1 = Int(posibleNubmer1)
        print("convertNumber1 = \(String(describing: convertNumber1))")
        
        //nil 修饰可选值  不可以修饰不可选值
        var serverResponsCode : Int? = 404
        serverResponsCode = nil
        print("serverResponsCode = \(serverResponsCode ?? 0)")
        
        var serverResponsCode1 = 404
        //        serverResponsCode1 = nil
        
        //总结 --> swift:可选类型  kotlin:String? 一种类型？
        //swift:一种类型和nil的父集
        //kotlin:一种类型和null的父集
        //更大范围类型的指针可以指向：具体类型的值或者nil和null
        
        //可选绑定 用来判断可选类型是否包含值,并且取出可选类型的值
        //如果optionalBindingNubmer 包含值，那么 optionalBindingNumber 就可以把值赋值给bindingNum，
        //赋值操作也有返回值，赋值成功返回 true ,失败返回 false
        var optionalBindingNumber : Int? = nil
        if let bindingNum = optionalBindingNumber {
            print("bindingNum = \(bindingNum)")
        }
        //可以将多个可选绑定值 放在if 语句中
        if var num1 = optionalBindingNumber ,var num2 = optionalBindingNumber , var num3 = optionalBindingNumber {
            print("只要有一个是false，整体就是false")
        }
        
        //在kotlin中 使用！来表示一个可选类型确定有值，编译器不检查编译错误
        //在swift中这里使用！来表示 隐士解析可选类型 （implicity unwrapped optionals）,
        let optionalString : String? = "an optional string"
        let forcedString : String = optionalString! //可选类型需要！来取值
        
        let implicityUnwrappedOptionalString : String! = "implicityUnwrappedString"
        let getImplicityUnwrappedOptionalString : String = implicityUnwrappedOptionalString  //隐式可选类型的值可以直接获取
        //也可以使用一下方式 取出隐式解析可选值的值
        if implicityUnwrappedOptionalString != nil {
            print(implicityUnwrappedOptionalString)
        }
        if let implicityUnwrappedOptionalString1 : String = implicityUnwrappedOptionalString {
            print(implicityUnwrappedOptionalString1)
        }
        
        //断言 和 先决条件
        //断言：只在调试阶段起作用
        //先决条件：生产环境和调试环境同样起作用
        let assertNumber = -3
        //断言 ... 应该怎么样 ，如果没有 ... 就会报错
        assert(assertNumber < 0,"在调试阶段，如果这里不符合断言的判断，程序就会在这里报错")
        
        //失败断言:只要程序走到这里 就会报错
        //        assertionFailure()
        
        // 先决条件
        let preconditionNumber = 5
        //        precondition(preconditionNumber < 0 ,"preconditionNumber must more than zero")
        
        //异常处理 swift的try ... catch 就是这个样子，跟Android的比起来太弱了，只能try 方法吗，能try指定的代码吗
        do{
            try canThrowAnError(a:"sdkfj")
        }catch{
            print("canThrowAnError 这个方法出现了异常")
        }
    }
    
    

    //swift 中的 方法关键字是fun kotlin中的方法关键字是 fun
    func canThrowAnError(a:String)throws{ //如果这个方法出了异常，这个方法会自动抛出异常
        
        
        
        
    }

}

