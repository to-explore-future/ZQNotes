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
        //各种进制的表示
        let decimalInteger = 17;
        let binaryInteger = 0b10001;
        let octalInteger = 0o21;
        let hexInteger = 0x11;
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
 
        
        
        
        
    }


}

