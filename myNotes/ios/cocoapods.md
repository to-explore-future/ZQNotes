### CocoaPods
1.是什么

  在Android中需要的类库，只需要一行代码（添加依赖）基本上就可以使用了（后面有工具会搞定这一行代码到底在后台执行那些操作[依赖中的依赖，如何编译，如何升级版本。。。]）
		
  那么ios中也有一个类似的工具吧，CocoaPods（Cocoa principles of database system）,有了这个工具，就好比 有了Android中添加依赖就能使用三方库的功能，这个工具能够管理三方库的更新，编译，配置，使自己项目的源代码和依赖库的源代码分开，
	
	
2.怎么用

[怎么使用，这里写的很详细，按照操作一步一步来来](http://www.jianshu.com/p/9e4e36ba8574)


#### 详细步骤
以后就是这个  拿来就用 知道吗，脑子是用来模式识别的 而不是用来存储东西的

`想要快速应用 就看 高亮标记的代码`  

1.cd到项目的目录最外层 `pod init` 

什么结果：在项目中 自动生成了 一个 `Podfile` 文件，这个文件的内容 如下

```
 # Uncomment the next line to define a global platform for your project
 # platform :ios, '9.0'

target '关于高德地图 demo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for 关于高德地图 demo

end

```
在 do 和 end 中间 写我们想要的 框架名称  
怎么写   ：比如 

命令行 ：`pod 'AFNetworking'` 

把 搜索结果中 

`pod 'AFNetworking', '~> 3.1.0'`  粘贴到 `do` and `end` 中 


```
 # Uncomment the next line to define a global platform for your project
 # platform :ios, '9.0'

target '关于高德地图 demo' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for 关于高德地图 demo
  
pod 'AFNetworking', '~> 3.1.0'

end

```
`按照这种节奏 把所有的 ` 框架都 填写好 

组后 都写好之后 呢  `pod install`

#### 常用的一些三方库 
pod 'AFNetworking', '~> 3.1.0'
pod 'SDWebImage', '~> 4.1.2'
pod 'Masonry', '~> 1.1.0'
pod 'YYKit', '~> 1.0.9'
pod 'AMapNavi', '~> 5.3.0'

 
 



