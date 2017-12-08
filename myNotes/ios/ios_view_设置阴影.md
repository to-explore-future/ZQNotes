### ios view 设置阴影



```
// 注释部分选择性使用
// 设置layer圆角半径
//        cell.view.layer.cornerRadius=2.0;
        // 即阴影颜色值
        cell.view.layer.shadowColor=[[UIColor grayColor] CGColor];
        // 即阴影相对于Y轴有1个像素点的向下位移。
        cell.view.layer.shadowOffset = CGSizeMake(0, 0);
        
        //设置阴影的不透明度
        cell.view.layer.shadowOpacity = 0.6;
        // 阴影的模糊度
        cell.view.layer.shadowRadius = 5;
        // 阴影的位置
//        cell.view.layer.shadowPath = [[UIBezierPath bezierPathWithRect:cell.view.bounds] CGPath];
        //设置缓存 仅复用时设置此选项。
//        cell.view.layer.shouldRasterize=YES;
        //设置抗锯齿边缘
//        cell.view.layer.rasterizationScale=[UIScreen mainScreen].scale;


```

