### Xcode ios 中pt的解释
当开发者 选择好自己针对开发的平台，AppIcon中都是提示开发者:

有这么几种情况下需要开发者提供指定格式的图标：

1.`iPhone Notification iOS 7-10 20pt	2x	3x`

在`iPhone`平台下，系统版本`7-10`，当系统`Notification`的时候,系统需要2x,3x图。

`20pt`：就是说你给的2x，3x图片在屏幕上占用20pt(20pt是针对`屏幕分辨率`的)

`2x、3x多大`：

2x--> 20(*2) * 20(*2) --> 40*40 分辨率

3x--> 20(*3) * 20(*3) --> 60*60 分辨率

2.`iPhone Spotlight - iOS5,6 Setting - iOS 5-10  29pt	2x  3x`

在`iPhone`平台下，系统版本 5-10的时候`Setting`，系统版本5，6的时候`Spotlight`使用的图片

同上面：`29pt`

这时候需要多大的图片呢

2x--> 29(*2) * 29(*2) --> 58*58 分辨率

3x--> 29(*3) * 29(*3) --> 87*87 分辨率
