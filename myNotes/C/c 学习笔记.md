### unix 命令
- <code>touch</code>:创建文件 --> <code>touch a.txt</code>

### 手动编译
1. <code>cc -c test.c</code> --><code>test.o</code>
2. <code>cc test.o</code> --> <code>a.out</code>
3. <code>./a.out</code> --> 打印内容：<code>"我是中国人"</code>

### cd 到指定的目录
1. cd 拖拽指定目录下面的文件 到终端 自动显示路径 去掉后面的文件名称

### include  
- 是一个预处理指令（文件包含指令）
   - 把要包含的文件的内容拷贝到当前书写<code>include</code>的地方


```
#include <stdio.h>
int main(int argc, const char * argv[ ]) {
    #include "a.txt"
    return 0;
}
```
a.txt里面的内容

```
printf("aaaa");
```


#### include< >
1.<code>stu</code>:standard 
2.<code><></code>:引入系统头文件
3.<code>查找顺序</code>-->编译器include --> 系统include --> 报错
- #### include""
1.<code>查找顺序</code>-->当前文件所在目录 --> 编译器include --> 系统include --> 报错
### 内存地址
1. 地址分配原则：
> 先定义的变量，分配高地址
低的字节放在低地址，高字节放在高地址。


<code>指针指向地址，每个指针都是一个常量</code>

<code>数组的名称存放了数组的首地址，数组是连续的内存空间，只使用这块连续的内存空间的低地址，就能够表示这块内存空间</code>

![a](https://github.com/to-explore-future/LearningNotes/blob/master/Res/%E4%BD%8E%E7%9A%84%E5%AD%97%E8%8A%82%E6%94%BE%E5%9C%A8%E4%BD%8E%E5%9C%B0%E5%9D%80%EF%BC%8C%E9%AB%98%E5%AD%97%E8%8A%82%E6%94%BE%E5%9C%A8%E9%AB%98%E5%9C%B0%E5%9D%80.png)


```
 #include <stdio.h>

void 地址的使用(){
    char str[10] = "abcdefg";
    //打印结果是一样的，这块内存空间的地址是使用这块内存空间的最低的地址保存的，
    //str,&str[0] 都是保存的这块内存空间的最低地址，%s拿到这个地址以后，
    //就会从这个地址开始往高地址一直打印，直到遇到 \0 结束，
    printf("%s\n",str);
    printf("%s\n",&str[0]);
}

int main(int argc, const char * argv[]) {
    // insert code here...
    地址的使用();
    printf("Hello, World!\n");
    return 0;
}

```

### 关于%s
- 作用
  - 打印字符，直到遇到<code>\0</code>
  - 字符数组的末尾，默认有一个<code>\0</code>
  - 如果使用<code>%s</code>打印字符串的话，字符串的底层是字符数组，末尾一定会有<code>\0</code>,所以就一定会结束打印，如果同样使用<code>%s</code>，胡乱给一个地址，<code>%s</code>会从你给的地址开始，一直往高地址访问，直到遇到<code>\0</code>才会结束。

```
    char arr1[] = "abc";//先声明高地址
    char arr2[] = ['b','c','d'];//后声明低地址
    printf("%s",arr2);//输出结果是什么
    // 大概率 arr1在内存中会挨着arr2，打印完arr2的时候，并没有遇到 "\0"所以，就继续往高地址打印，直到遇到的arr1，arr1中默认包含着一个 "\0",所以结束了，如果arr2的前面没有声明一个arr1，赶上你点背（就是遇不到一个 "\0"），指不定会出什么问题。
```


#### 二维数组
1.定义方式

```
    int a[3][3] = {{1,2,3},{1,2,3},{1,2,3}};
    int b[3][3] = {1,2,3,1,3,2,1,3,2};//自动识别
    int c[][3] ={1,2,3,1,3,2,1,3,2};//自动识别 有几个小数组
    int d[3][3] = {};// 初始化 不给数据，默认给0
    int e[3][3] = {3,4};//初始化数据没有给全，自动补0
```

2.数组的行数与列数

```
    sizeof(array) //获取数组的字节数
    a[3][3];
    行数：hang = sizeof(a) / sizeof(a[0]); //数组总的字节数 / 数组每一行的字节数 
    列数：lie = sizeof(a[0]) / sizeof(int); //每一行的字节数 / 每一行的元素字节数
```


  [1]: https://github.com/to-explore-future/LearningNotes/blob/master/Res/%E4%BD%8E%E7%9A%84%E5%AD%97%E8%8A%82%E6%94%BE%E5%9C%A8%E4%BD%8E%E5%9C%B0%E5%9D%80%EF%BC%8C%E9%AB%98%E5%AD%97%E8%8A%82%E6%94%BE%E5%9C%A8%E9%AB%98%E5%9C%B0%E5%9D%80.png "低字节放在低地址，高字节放在高地址"