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
        字符串和字符()
        集合类型()
        
    }
    
    func 集合类型() {
        //swift引入了三种基本集合类型来保存数据
        // Array:有序的
        // Set : 无序不重复
        // Dictionaries: 字典
        // 修饰符：使用var 表示集合是可变的  使用let表示集合是不可变的
        
        
        //创建一个空数组
        var emptyArray = [Int]()
        //给数组添加一个元素
        emptyArray.append(5)
        //把集合置空
        emptyArray = []
    }
    
    //基础部分
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
        
        //在Java中，运算时如果类型不同，范围小的会自动强转成范围大的类型 -->隐式转换
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
    
    //基本运算符
    func basicOprators() {
        //求余 余数只跟被除数有关系
        let remainder = 9 % 4
        let remainder1 = 9 % -4
        let remainder2 = -9 % 4
        let remainder3 = -9 % -4
        print("remainder:\(remainder) remainder1:\(remainder1) remainder2:\(remainder2) remainder3:\(remainder3)")
        
        // == === :kotlin中 ==:比较的是值  ===：比较的是内存地址
        // 那么在swift中，== 与 ===的区别是什么呢 以后解决
        
        //元组的比较：从左到右会按照元素的对应位置进行比较
        if (6,1) > (5,10) {
            print("在比较大小的时候，如果一个位置得出了大小关系，虽然这个元组中还有剩下的元素没有比较完，但是比较运算还是结束了，如果得出相等的结果，那么运算就继续")
        }
        if (5,"string") == (5,"string") {
            print("如果是 == 比较，必须元组中的所有的对应位置的元素都相等才能为 true，如果在从左到右比较的过程中发现有一个元素不相同，那么比较结束，得出结论false")
        }
        
        //空合运算 ：对可选类型取值的运算符
        // a = b ?? c //对b进行nil判断，如果b是nil，那么就取出c的值给a，如果b不是nil，那么就取出b的值，给a
        //模拟一下
        let b : Int? = nil // 5
        let c = 8
        let a = b ?? c
        print("a = \(a)")
        
        
        //区间运算
        //1.闭区间运算符   1...5 表示 1-5 的一个闭区间
        for index in 1...5{
            print("index : \(index)")
        }
        
        //半开区间  ->左闭右开 ？？有没有右闭左开的区间呢 可能只有一侧的
        let names = ["tom","Lili","jack","lucy"]
        let count = names.count
        for i in 0..<count{
            print("name\(count + 1) : \(names[i])")
        }
        
        //单侧区间  解释一下：单侧区间的值从哪里开始从哪里结束呢
        //从数组的 开始角标开始，从数组的结束角标结束
        for name in names[2...]{
            print("单侧区间 2... :\(name)")
        }
        
        for name in names[...2]{
            print("单侧区间 ...2 : \(name)")
        }
        
        //单侧区间也可以 结合半开区间 这样表示 可能只有向左的 单侧开区间
        for name in names[..<2]{
            print("单侧区间 不包含最后一位 ..<2:\(name)")
        }
        
        //以上的各种区间的表示方法 这些都是对象 可以使用变量接收的
        let range1 = 1...2  //闭区间
        let range2 = 1..<5  //左闭右开
        let range3 = ...2   //单侧闭区间  方向向左
        let range4 = 2...   //单侧闭区间  方向向右
        let range5 = ..<5   //单侧开区间  方向向左
        //注意遍历的时候 单侧区间 方向向左的 ，要注意这种区间没有初始值，遍历可能会出问题
        //可以遍历方向向右的单侧区间，可以自己手动添加 结束条件
        range1.contains(1)
        range2.contains(5)
        range3.contains(4)
        range4.contains(100)
       
    }
    
    //swift 中的 方法关键字是fun kotlin中的方法关键字是 fun
    func canThrowAnError(a:String)throws{ //如果这个方法出了异常，这个方法会自动抛出异常
        
    }
    
    func 字符串和字符() {
        // \ : 多行字符串结尾添加，表示续行
        // 开始和结束的时候都添加了换行，这样在展示的时候都会有换行
        let qustion = """

The White Rabbit put on his spectacles.  "Where shall I begin,\
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."

"""
        print(qustion)
        
        
        let question1 = """
        if (6,1) > (5,10) {
            print("在比较大小的时候，如果一个位置得出了大小关系，虽然这个元组中还有剩下的元素没有比较完，但是比较运算还是结束了，如果得出相等的结果，那么运算就继续")
        }
        if (5,"string") == (5,"string") {
            print("如果是 == 比较，必须元组中的所有的对应位置的元素都相等才能为 true，如果在从左到右比较的过程中发现有一个元素不相同，那么比较结束，得出结论false")
        }
        """  //关闭引号决定了 多行字符串的每行的缩进,所有行都不能超过 关闭引号
      print(question1)
        
        //多行字符串怎么包含 “”“
        let question2 = """
第一种方式 \"""
第二种方式 \"\"\"
"""
        print(question2)
        
        //初始化空字符串 : 两种方式
        var emptyString = ""
        emptyString = String()
        if emptyString.isEmpty {
            print("emptyString is an empty String")
        }
        
        //注意：String 类型是值类型 ，在参数传递的时候，原值不会改变，参数值会改变
        //只有引用类型才会改变原值 -> 一个指针指着某个内存区域这个对象
        
        //使用字符
        for character in "Dog!🐶" {
            print(character)
        }
        
        //swift 中的字符类型使用关键字 Character ,并且字符串和字符都是使用双引号表示
        let character : Character = "r"
        let characterOrString = "a"
        //一个字符既可以用字符表示，也可以用字符串表示，如果不明确标明类型，默认是 String 类型
        
        
        //字符串的拼接
        var aa = "aaa"
        aa += "bbb"
        aa.append("ccc")
        print(aa)
        
        //多行字符串的换行：要主动加上换行
        let badStart = """
one
two
"""
        let end = "three"
        let result = badStart + end
        print("result: " + result)
        
        let goodStart = """

one
two

"""
        let goodResult = goodStart + end
        print("goodResult:" + goodResult)
        
        //字符串的索引
        let greeting = "hotdog"
        print(greeting[greeting.startIndex])
//        print(greeting[greeting.endIndex])
        print(greeting[greeting.index(after: greeting.startIndex)])
        print(greeting[greeting.index(before: greeting.endIndex)])
        print(greeting[greeting.index(greeting.startIndex, offsetBy: 2)])
        
        //endindex 会越界
        for index in greeting.indices {
            print("\(greeting[index])")
        }
        
        //字符串中插入、删除 字符和字符串
        var testString = "to explore future"
        testString.insert("a", at: testString.endIndex)
        print(testString)
        
        

        //前缀和后缀
        if testString.hasPrefix("to") {
            print("\(testString) has prefix : to")
        }
        
        if testString.hasSuffix("ea") {
            print("\(testString) has suffix : ea")
        }
        
    
        
        
        
        
        
        
            
        
    }

}

