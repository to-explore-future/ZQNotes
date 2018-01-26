//
//  MyLayout.m
//  自定义流式布局
//
//  Created by to-explore-future on 17/12/8.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "MyLayout.h"

@interface MyLayout()

@property(nonatomic,strong)NSArray          * datas;
@property(nonatomic,strong)UIFont           * font;
@property(nonatomic,strong)NSMutableArray   * labelArray;
@property(nonatomic,strong)NSMutableArray   * groupedLabelArray;//分组后的 数组
@property(nonatomic,strong)NSMutableArray   * remainingWidths;
@property(nonatomic,strong)NSMutableArray   * everyLineLabelShouldAddWidth;
@property(nonatomic,assign)CGFloat            lineSpace;
@property(nonatomic,assign)CGFloat            rowSpace;

@property(nonatomic,assign)CGFloat            paddingLeft;
@property(nonatomic,assign)CGFloat            paddingRight;
@property(nonatomic,assign)CGFloat            paddingTop;
@property(nonatomic,assign)CGFloat            paddingBottom;

@property(nonatomic,assign)CGFloat            padding;
@property(nonatomic,assign)CGFloat            totalHeight;      //这个控件的总高度

@end

@implementation MyLayout

-(instancetype)init{
    self = [super init];
    if (self) {
        self = [[MyLayout alloc] init];
    }
    return self;
}

/**
 *  设置行间距
 */
-(void)setLinespace:(CGFloat)lineSpace{
    self.lineSpace = lineSpace;
}

/**
 *  设置列间距
 */
-(void)setRowspace:(CGFloat)rowSpace{
    self.rowSpace = rowSpace;
}

/**
 *  设置元素的 paddingLeft
 */
-(void)setElementPaddinLeft:(CGFloat)paddingLeft{
    self.paddingLeft = paddingLeft;
}

/**
 *  设置元素的 paddingRight
 */
-(void)setElementPaddinRight:(CGFloat)paddingRight{
    self.paddingRight = paddingRight;
}

/**
 *  设置元素的 paddingTop
 */
-(void)setElementPaddinTop:(CGFloat)paddingTop{
    self.paddingTop = paddingTop;
}

/**
 *  设置元素的 paddingBottom
 */
-(void)setElementPaddinBottom:(CGFloat)paddingBottom{
    self.paddingBottom = paddingBottom;
}

/**
 *  设置 self 的 padding
 */
-(void)setSelfPadding:(CGFloat)padding{
    self.padding = padding;
}

-(void)initData{
    self.lineSpace      = 5;
    self.rowSpace       = 5;
    
    self.paddingLeft    = 6;//控件中每个元素的 左 内边距
    self.paddingRight   = 6;//控件中每个元素的 右 内边距
    self.paddingTop     = 3;//控件中每个元素的 上 内边距
    self.paddingBottom  = 3;//控件中每个元素的 下 内边距
    
    self.padding        = 5;//这个是这个控件的 整体的内边距
    
}

-(void)setData:(NSArray<NSString *> *)datas{
    self.datas = datas;
    
    //设置行间距 设置列间距
//    CGFloat lineSpace = 5;
//    CGFloat rowSpace = 5;
    //我们理解 这儿文字呢 默认情况下 得有一个内边距 sizeToFit 之后 得到的 是没有内边距的文字
    //所以呢 每个 label 默认给3个单位的内边距  左右内边距 和上下内边距
//    CGFloat paddingLeft = 6;
//    CGFloat paddingRight = 6;
//    CGFloat paddingTop = 3;
//    CGFloat paddingBottom = 3;
    
    //有了数据之后  把集合中的每一个 string 拿出来 创建对应的 uilabel
    for (int i  = 0 ; i < datas.count; i ++) {
        UILabel * label = [[UILabel alloc] init];
        [label setFont:self.font];
        [label setBackgroundColor:[UIColor greenColor]];
        label.text = datas[i];
        label.layer.cornerRadius = 5;
        label.clipsToBounds = YES;
        [label setTextAlignment:NSTextAlignmentCenter];
        [label sizeToFit];
        [self.labelArray addObject:label];
    }
    //第二部 有了这么多的 label 绘制
    CGFloat selfWidth = self.frame.size.width;    //控件本身的宽度
//    CGFloat padding = 5;//控件的边距
    CGFloat selfValidWidth = selfWidth - self.padding * 2;
    CGFloat sumWidth = 0;
    
    //开始分组
    //分组之前  首先创建一个 第一行的集合
    NSMutableArray * oneLine = [NSMutableArray array];  //这个就是每一行的 行集合的索引 重复利用
    [self.groupedLabelArray addObject:oneLine];         //第一次 首先加入到分组集合中
    //每个 label 之间是有一定的间距的 ，rowspace
    
    NSInteger number = 0;               //累计每一行有多少个元素
    for (int i = 0 ; i < datas.count; i ++) {
        UILabel * label = self.labelArray[i];
        CGFloat width = label.frame.size.width;   //这个控件的宽度
        width += (self.paddingLeft + self.paddingRight);
        
        sumWidth += width;
        NSLog(@"sumWidth = %f",sumWidth);
        
        if (sumWidth >= selfValidWidth) {  //如果累加的宽度 大于或者等于 本身的宽度
            NSLog(@"这一行有   %ld  个元素",number);
            number = 0;
            //说明该换行了  则需要一个新的 行数组
            sumWidth = 0;
            sumWidth += width;//一定要注意 ，一旦要换行 说明这个 label 是下一个集合中的元素了 ，记得 宽度累加啊
            //进行开启新的一行的操作
            oneLine = [NSMutableArray array];   //开启一个新的集合
//            [oneLine addObject:label];
            //新的一行开启之后 sumWidth = 0
            [self.groupedLabelArray addObject:oneLine];
        }else{ //如果没有超过控件本身的宽度  继续累加 把这个 label 加到行集合中  说明这一行还可以容得下 这个 label
//            [oneLine addObject:label];
//            sumWidth += width;
            //在上面首先加上 label 的宽度 ，计算了一次 该不该换行，如果不改换行的 那么这里加上
            sumWidth += self.rowSpace;
        }
        
        [oneLine addObject:label];//只要是 sumWidth 重置之后 ，这个 online 就会指向一个新的集合
        number ++;
    }
    NSInteger sumCount = 0;
    NSInteger tempCount = self.groupedLabelArray.count;
    for (int i = 0 ; i < tempCount; i++) {
        NSArray * temp =  self.groupedLabelArray[i];
        sumCount += temp.count;
    }
    NSLog(@"sumCount = %ld",sumCount);
    //测试分组的结果
    
    
    /**
     *  绘制之前呢 计算一下 每一行   - 控件的内边距 - labelSpace 还剩下多少 剩余空间 ，把这些多余的空间 平局分配到 每个 label
     *  的宽度上面
     */
    for (int i = 0 ; i < self.groupedLabelArray.count - 1; i++) {
        NSArray * temp = self.groupedLabelArray[i];
        NSInteger count = temp.count;
        CGFloat sumWidth = 0;
        for (int j = 0 ; j < count; j++) {
            //我要计算出 每一样剩余 多少可用的空间
            UILabel * label = self.groupedLabelArray[i][j];
            CGFloat width = label.frame.size.width;
            width += (self.paddingLeft + self.paddingRight);
            sumWidth += width;
        }
        CGFloat remainingWidth = selfValidWidth - sumWidth - self.rowSpace * (count - 1);//除了减去字体的总宽度 还要减去 字体之间的间距的总和
//        NSNumber *remainWidth = [NSNumber numberWithInteger:remainingWidth];
        //我把求出的这个每一行 剩下的宽度 存到一个集合中 ，
//        [self.remainingWidths addObject:remainWidth];
        //我应该把每一行的 剩余的宽度 平均分配到 每个 label 的宽度上
        CGFloat everyLabelShouldAddWidth = remainingWidth / count;
        NSNumber * lineLabelShouldAddWidth = [NSNumber numberWithFloat:everyLabelShouldAddWidth];
        [self.everyLineLabelShouldAddWidth addObject:lineLabelShouldAddWidth];
        sumWidth = 0;
        NSLog(@"remainingWidth = %f",remainingWidth);
    }
    //让最后一行 不平分 多余的宽度
    [self.everyLineLabelShouldAddWidth addObject:[NSNumber numberWithInt:0]];
    /**
     *  开始绘制
     */
    //得到其中任意一个 label 的 高度
    UILabel * ll = self.groupedLabelArray[0][0];
    CGFloat setLabelHeight = ll.frame.size.height;
    //计算高度
    _totalHeight += self.padding;    //加上一个 paddingTop
    
    for (int i = 0 ; i < tempCount; i++) {              //外层循环 决定行高 行间距
        //只要外循环进来了 说明这样行有东西 说明这一行的高度应该算进来
        /**
         *  当计算这个控件的高度的时候呢 一定要考虑到 得到的每个元素的高度 只是这个元素的实际的高度 ，
         *  而我是给这个元素添加了 内边距的
         */
        if (i == 0) {//如果不是第一行 ，其余所有的行都加上一个
            _totalHeight += setLabelHeight + (_paddingTop + _paddingBottom);
        }else{
            _totalHeight += (setLabelHeight + _lineSpace + _paddingTop + _paddingBottom);
        }
        NSLog(@"totalHeight = %f",_totalHeight);
        
        NSArray * lineArray = self.groupedLabelArray[i];
        //每一行的高度 应该在外面计算
        CGFloat y = 0;
        if (i == 0 ) {
            y = self.padding;
        }else{
            y = i * (setLabelHeight + (self.paddingTop + self.paddingBottom)+ self.lineSpace) + self.padding;
        }
        CGFloat thisLineLabelShouldAddWidth = [self.everyLineLabelShouldAddWidth[i] floatValue];
        CGFloat sumX = 0;//每个控件的 x 的位置 累加记录一下
        
        for (int j = 0 ; j < lineArray.count; j++) {
            //先不考虑间距
            UILabel * label = lineArray[j];
            CGFloat labelWidth = label.frame.size.width;
//            labelWidth += thisLineLabelShouldAddWidth;
            labelWidth += (self.paddingLeft + self.paddingRight) + thisLineLabelShouldAddWidth;
            CGFloat labelHeight = label.frame.size.height;
            labelHeight += (self.paddingTop + self.paddingBottom);
            
            CGFloat x = 0;  //不管是哪个 label 都要首先取出他的实际宽度 记录一下 累加一下
            if(j == 0 ){
                x = self.padding;
                sumX = self.padding;
                sumX += labelWidth ;
            }else{
                x = sumX + self.rowSpace * j;//加上 label 个数- 1 个的间距
                sumX += labelWidth ;
            }
//            sumX += labelWidth + rowSpace;
//            sumX += labelWidth ;
//            CGRect labelFrame = label.frame;
            CGRect rect = CGRectMake(x, y, labelWidth, labelHeight);
            [label setFrame:rect];
            
            [self addSubview:label];
        }
    }
    _totalHeight += self.padding;
    NSLog(@"totalHeight = %f",_totalHeight);
    
    //计算这个控件的高度 无非就是把所有的 相关的高度累加起来
    // paddingTop + paddingBottom + labelHeight*lineNum + lineSpace*(lineNum - 1)
    CGRect rect = self.frame;
    rect.size.height = _totalHeight;
    [self setFrame:rect];
}

-(void)setTextFont:(UIFont *)font{
    self.font = font;
}

#pragma mark - lazyLoad

-(NSArray *)datas{
    if (_datas == nil) {
        _datas = [NSArray array];
    }
    return _datas;
}

-(UIFont *)font{
    if (_font == nil) {
        _font = [UIFont systemFontOfSize:22];
    }
    return _font;
}

-(NSMutableArray *)labelArray{
    if (_labelArray == nil) {
        _labelArray = [NSMutableArray array];
    }
    return _labelArray;
}

-(NSMutableArray *)groupedLabelArray{
    if (_groupedLabelArray == nil) {
        _groupedLabelArray = [NSMutableArray array];
    }
    return _groupedLabelArray;
}

-(NSMutableArray *)remainingWidths{
    if (_remainingWidths == nil) {
        _remainingWidths = [NSMutableArray array];
    }
    return _remainingWidths;
}

-(NSMutableArray *)everyLineLabelShouldAddWidth{
    if (_everyLineLabelShouldAddWidth == nil) {
        _everyLineLabelShouldAddWidth = [NSMutableArray array];
    }
    return _everyLineLabelShouldAddWidth;
}



@end
