### MAC下怎么带密码压缩文件
`格式`：`zip` `参数` `压缩后的文件` `源文件`

`参数`：
	
```
-e	加密压缩
-r	压缩的是目录	 	
-q	不显示压缩进度
	 	
```
	 		 
`举例1`：
	
```
zip -re hello.zip hello
把hello目录，压缩成hello.zip并且加密，-re 是 -r -e 的连写形式
执行后会让你输入两次密码
```
	 	 
`举例2`：

```
zip -e a.jpg.zip a.jpg
把a.jpg带密码压缩成 a.jpg.zip。
```