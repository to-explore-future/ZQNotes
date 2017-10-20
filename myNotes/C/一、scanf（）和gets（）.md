### 一、scanf（）和gets（）
1.scanf()

* 所在头文件：stdio.h
* 语法：scanf(“格式控制字符串”,变量地址列表);
* 接受字符串时：scanf(“%s”,字符数组名或指针);

2.gets()

* 所在头文件：stdio.h
* 语法：gets(字符数组名或指针);

3.两者在接受字符串时：

1. 不同点：scanf不能接受空格、制表符Tab、回车等；
2. 而gets能够接受空格、制表符Tab和回车等；
3. scanf ：当遇到回车，空格和tab键会自动在字符串后面添加’\0’，但是回车，空格和tab键仍会留在输入的缓冲区中。
4. gets：可接受回车键之前输入的所有字符，并用’\0’替代 ‘\n’.回车键不会留在输入缓冲区中 


```
#include<stdio.h>​
int main(){    
	char a[10];​    
	scanf("%s",a);​    
	printf("%s\n",a);​    
	return 0;
}
```
从键盘输入字符串 asd df时，遇到空格，scanf（）就认为输入结束了，所以a中存放的字符串是 ‘asd\0’。 

```
#include<stdio.h>​
int main(){    
	char a[10];​    
	gets(a);​    
	printf("%s\n",a);​    
	return 0;
}
```

从键盘输入字符串 asd df时，gets（）遇到’\n’才认为是结束输入了，所以a中存放的是’asd df\0’。 

```
 #include<stdio.h>​

int main(){    
	char a[10],b[10];    
	char c,d;    
	scanf("%s",a);    
	printf("a中保存的字符串为：%s\n",a);​ 
	   
	c=getchar();    
	printf("c中保存的字符为：%c ",c);​ 
	   
	gets(b);    
	printf("b中保存的字符串为：%s\n",b);​ 
	   
	d=getchar();    
	printf("d中保存的字符为：%c",d);​ 
	   
	return 0;
}
```
输入asdf回车，因为scanf会将回车保留在缓冲区中，所以回车会紧接着被c取得而不需要再额外输入，所以a中存储的是’asdf\0’，字符c=’\n’。结果如下：

```
asdf
a中保存的字符串为：asdf
c中保存的字符为：
```
 
接着输入as df回车，因为gets会将’\n’替换成’\0’，所以b字符串中保留的是’as df\0’，并且还是要继续输入d的值： 
最后输入d的值：

```

```
 
### 二、printf（）和puts（）的区别
##### 相同点： 
2. 两者都属于stdio.h这个头文件 
3. 都能输出字符串

##### 不同点： 
puts（）在输出字符串时会将’\0’自动转换成’\n’进行输出，也就是说，puts方法输出完字符串后会自动换行。这一组比较简单，就不再举例子了。