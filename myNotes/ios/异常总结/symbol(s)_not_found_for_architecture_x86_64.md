### symbol(s) not found for architecture x86_64
今天引入了一个三方二维码展示库，一切准备就绪，就在 等奇迹出现的时候 一运行 就报了这个一个错误

解决方案 [yaoliangjun306](http://blog.csdn.net/yaoliangjun306/article/details/70245778)

我想了想 这个问题到底是怎么导致的呢 我才就是：这个三方开源库 你只是使用 cocoapod 导入还是不够，还得关联一下，告诉编译器（我又用了...）

告诉的方式：就像文中作者说的

- `$(inherited)` 
   - 这种是通用做法，就是告诉编译器：我具体用了啥 我不告诉你 你自己探索 嘿嘿
- `Linked Frameworks and Libraries`
   - 这种做法就是，我做了什么我都一一的告诉编译器 