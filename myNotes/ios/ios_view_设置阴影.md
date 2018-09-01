### ios view 设置阴影


```
// 注释部分选择性使用
// ** 使用之前要给设置阴影的view设置背景颜色
// **  UIView * view = [[UIView alloc] init];
// **  view.setBackGroundColor = [UIColor whiteColor];

// view.layer.cornerRadius=2.0;			             // 设置layer圆角半径
view.layer.shadowColor=[[UIColor grayColor] CGColor];// 即阴影颜色值
view.layer.shadowOffset = CGSizeMake(0, 0);          // 即阴影相对于Y轴有1个像素点的向下位移。   
view.layer.shadowOpacity = 0.6;                      //设置阴影的不透明度
view.layer.shadowRadius = 5;                         // 阴影的模糊度:这个会影响阴影的范围
//view.layer.shadowPath = [[UIBezierPath bezierPathWithRect:cell.view.bounds] CGPath];// 阴影的位置
//view.layer.shouldRasterize=YES;                    //设置缓存 仅复用时设置此选项。
//view.layer.rasterizationScale=[UIScreen mainScreen].scale;//设置抗锯齿边缘

```  
- 如果你的view 没有设置 backGroundColor 那么上述代码会对view的子view产生影响。

