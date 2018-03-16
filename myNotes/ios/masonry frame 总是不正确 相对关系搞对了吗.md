## masonry frame 总是不正确 相对关系搞对了吗

> masonry 布局比起autolayout好用很多，关于frame为0 的贴纸也很多 ，layoutIfNeeded 能够解决大部分问题

- 我遇到的问题

   > layoutIfNeeded 但部分能得到 frame 但是 得到的frame到底是以谁为基准 
   
### layoutIfNeeded 的frame 是以当前的view父view为基准的 
- 解决方案
	- 1.把那些没有正确的frame的view 变成self.view 的子view
	- 2.自己手动计算 目标view 相对于 相对view的frame
