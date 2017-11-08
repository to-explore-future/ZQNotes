### iOS开发基础流程

- 创建一个项目
- pod操作：
	- pod init:项目根目录
	- pod search 'xxx'
	- search 完毕之后 修改profile 文件
	- pod install

- 项目根目录总出现 白色的项目图标。打开
- PCH:(pro compoled header)预编译头文件
	- 创建
	- 放置位置：build setting --> prefix header --> `$(SRCROOT)/ZQLive/Class/base/ZQLive.pch` `note that $`
	- 验证：[self mas] 有提示吗，`前提`你已经 install Masonry
- icon launchuImage 放置：
	- LaunchImage
		- LaunchScreen.storyboard 取消use as launch screen
		- app Icon and Launch Image :Launch screen file 删除
		- 测试平台删除已安装版本
		- 本项目clean
		- 安装：应该会成功
- 配置宏
	- 常用代码配置成宏
	- 放到 `.pch` 文件中
- 类名添加头文件:profix header