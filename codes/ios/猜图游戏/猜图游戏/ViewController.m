//
//  ViewController.m
//  猜图游戏
//
//  Created by to-explore-future on 17/11/14.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import "BusinessStartsModel.h"
#import "ButtonFrameWithTag.h"

@interface ViewController ()

#pragma mark -

@property (weak, nonatomic) IBOutlet UIImageView    * image;
@property (weak, nonatomic) IBOutlet UILabel        * qustionPosition;
@property (weak, nonatomic) IBOutlet UILabel        * imageName;
@property (weak, nonatomic) IBOutlet UIButton       * BusinessStarImage;
@property (weak, nonatomic) IBOutlet UIButton       * shadow;
@property (weak, nonatomic) IBOutlet UIView         * answerView;
@property (weak, nonatomic) IBOutlet UIView         * optionsView;
@property BOOL                                        isBigImage;        //标记一下图片是否放大
@property(nonatomic,assign) NSInteger                 index;             //索引
@property(nonatomic,strong) NSMutableArray          * models;            //数据模型
@property CGRect                                      bigImageFrame;     //保存image尺寸
@property CGRect                                      smallImageFrame;   //保存image尺寸
@property(nonatomic,strong) NSMutableDictionary     * oldBtnFrames;      //保存
@property(nonatomic,strong) NSMutableDictionary     * answerBtnWithOptionBtnTag;    //

#pragma mark -

- (IBAction)nextQustion:    (UIButton *)    sender;
- (IBAction)imageBtnClick:  (UIButton *)    sender;
- (IBAction)magnifyImage:   (UIButton *)    sender;
- (IBAction)shadowClick:    (UIButton *)    sender;

@end

@implementation ViewController

#pragma mark -
//改变状态栏 重写两个方法
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

////隐藏状态栏
//- (BOOL)prefersStatusBarHidden{
//    return YES;
//}

#pragma mark - 初始化，懒加载

-(NSMutableDictionary *)oldBtnFrames{
    if (_oldBtnFrames == nil) {
        _oldBtnFrames = [NSMutableDictionary dictionary];
    }
    return _oldBtnFrames;
}

-(NSMutableDictionary *)answerBtnWithOptionBtnTag{
    if (_answerBtnWithOptionBtnTag == nil) {
        _answerBtnWithOptionBtnTag = [NSMutableDictionary dictionary];
    }
    return _answerBtnWithOptionBtnTag;
}




-(NSDate *)getDateTimeFromMilliSeconds:(long long) miliSeconds{
    
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;//这里的.0一定要加上，不然除下来的数据会被截断导致时间不一致
    NSLog(@"传入的时间戳=%f",seconds);
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

//将NSDate类型的时间转换为时间戳,从1970/1/1开始

-(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime{
    
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    NSLog(@"转换的时间戳=%f",interval);
    long long totalMilliseconds = interval*1000 ;
    NSLog(@"totalMilliseconds=%llu",totalMilliseconds);
    return totalMilliseconds;
}


#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimeInterval interval =  [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds1 = interval * 1000;
    
    for (int i = 0 ; i < 1000* 1000 * 1000; i++) {
        int b  = 500 * 345 *555;
    }
    
    NSTimeInterval interval2 =  [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds2 = interval2 * 1000;
    
    long long aa = totalMilliseconds2 - totalMilliseconds1;
    NSLog(@"aa = %lld",aa);
    
//    long long time = [self getDateTimeTOMilliSeconds:[NSDate date]];
//    
//    NSLog(@"%llu",time);
//    
//    NSDate *dat = [self getDateTimeFromMilliSeconds:time];
//    
//    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
//    
//    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss.SSS"];
//    
//    NSString *date =[formatter stringFromDate:dat];
//    
//    NSString *timeLocal = [[NSString alloc] initWithFormat:@"%@", date];
//    
//    NSLog(@"\n%@", timeLocal);
    

    
    
    
    
    
    
    
    
    
    self.isBigImage = NO;
    //设置 BusinessStarImage 的内边距,xcode 中不能设置。
    self.BusinessStarImage.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    if (self.models == nil) {
        self.models = [NSMutableArray array];
    }
    NSString * path = [[NSBundle mainBundle] pathForResource:@"images.plist" ofType:nil];
    NSArray* images = [NSArray arrayWithContentsOfFile:path];
    //一上来 就应该 把这个页面需要的资源的读取到 model 的集合中，(如果数据量不是很大的话)
    NSInteger count = images.count;
    for (int i = 0 ; i < count;  i++) {
        NSDictionary * dict         = images[i];
        BusinessStartsModel * model = [[BusinessStartsModel alloc]initWithDict:dict];
        [self.models addObject:model];
    }
    _index = -1;
    [self nextQustion:nil];
//    NSLog(@"self.models.count = %ld",self.models.count);
    [self initSmallBigImageFrame];
}

-(void)initSmallBigImageFrame{
    //计算大图的frame
    NSInteger width         = self.view.bounds.size.width;
    NSInteger height        = width;
    NSInteger y             = ([UIScreen mainScreen].bounds.size.height - height) / 2;
    self.bigImageFrame      = CGRectMake(0, y, width, height);
    //计算小图的frame
    self.smallImageFrame    = self.BusinessStarImage.frame;
}

/**
 *  下一个问题
 */
- (IBAction)nextQustion:(UIButton *)sender {
    NSInteger tempCount = self.models.count;
    if (_index == tempCount - 1) {
        return;
    }
    self.index++;
    BusinessStartsModel * model = self.models[_index];
    NSString * icon             =  model.icon;
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.BusinessStarImage setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal ];
        //设置title
        self.imageName.text     = model.title;
        //设置position
        NSString * positon      = [NSString stringWithFormat:@"%ld/%ld",_index+1,tempCount];
        self.qustionPosition.text = positon;
        //生成 答案按钮
        [self generateAnswerButtons:model];
        //生成 选择按钮
        [self generateOptionButtons:model];
    }];
}

//生成展示答案的按钮
-(void)generateAnswerButtons:(BusinessStartsModel*)model{
    //每次调用这个方法的时候 都要清除已经有的button
    while (self.answerView.subviews.lastObject != nil) {
        [self.answerView.subviews.lastObject removeFromSuperview];
    }
    //根据答案的长度生成 button的个数
    NSString * answer               = model.answer;
    NSInteger btnSpace              = 10;
    NSInteger width                 = 35;
    NSInteger height                = 35;
    NSInteger answerButtonCount     = answer.length;
    NSInteger answerButtonView_y    = self.answerView.bounds.origin.y;
    NSInteger answerViewHeight      = self.answerView.bounds.size.height;
    NSInteger startX = (self.answerView.frame.size.width -width * answerButtonCount - btnSpace *(answerButtonCount - 1) ) / 2;
    for (NSInteger i = 0; i < answerButtonCount; i++) {
        UIButton * btn  = [[UIButton alloc] init];
        NSInteger x     = startX + (width+btnSpace)*i;
        NSInteger y     = answerButtonView_y + (answerViewHeight - height) / 2 ;
        btn.frame       = CGRectMake(x , y , width , height );
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(answerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 5;
        btn.tag = 200 + i;
        [self.answerView addSubview:btn];
    }
}

/**
 *  当点击answerView button的时候 如果这个已经包含了文字 那么他的上面一定有一个optionViewbutton 
 *  取出这个button的title，然后把optonViewbutton 移走
 */
-(void)answerButtonClick:(UIButton *)sender{
    if (![sender.currentTitle  isEqual: @""]) {
        NSNumber *answerBtnTag  = [NSNumber numberWithInteger:sender.tag];
        NSNumber *optionBtnTag  = [self.answerBtnWithOptionBtnTag objectForKey:answerBtnTag];
        NSInteger obt           = [optionBtnTag intValue];
        UIButton * optionBtn    = [self.view viewWithTag:obt];
        ButtonFrameWithTag* bf  = [self.oldBtnFrames objectForKey:[NSNumber numberWithInteger:optionBtn.tag]];
        CGRect rect             = CGRectMake(bf.x, bf.y, bf.width, bf.height );
        [UIView animateWithDuration:0.6 animations:^{
            optionBtn.frame = rect;
            [optionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }completion:^(BOOL finished) {
            //optionBtn 按钮回去之后呢，就把它的tag值 移除出 这字典
            [self.answerBtnWithOptionBtnTag removeObjectForKey:answerBtnTag];
        }];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    
}

//生成展示 选择按钮
-(void)generateOptionButtons:(BusinessStartsModel*) model{
    while (self.optionsView.subviews.lastObject != nil) {
        [self.optionsView.subviews.lastObject removeFromSuperview];
    }
    
    NSString * options          = model.options;
    NSInteger optionButtonCount = options.length;
    //首先明确一行要放置多少个button
    NSInteger btnCountOneLine   = 7;
    NSInteger btnWidth          = 35;
    NSInteger btnHeight         = 35;
    //每个button的左右上下的间距
    NSInteger btnSpace = (self.optionsView.bounds.size.width - btnWidth * btnCountOneLine) / (btnCountOneLine + 1);
    for (NSInteger i = 0 ; i < optionButtonCount; i++) {
        UIButton * btn          = [[UIButton alloc]init];
        NSInteger x             = btnSpace + (btnWidth + btnSpace) * (i % 7);
        NSInteger y             = btnSpace + (btnHeight + btnSpace) * (i / btnCountOneLine );
        btn.frame               = CGRectMake(x , y , btnWidth , btnHeight);
        btn.backgroundColor     = [UIColor grayColor];
        btn.layer.cornerRadius  = 5;
        [btn addTarget:self action:@selector(optionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
        [self.optionsView addSubview:btn];
    }
    
    //把文字显示到button上
    NSMutableArray * optionCharArray = [NSMutableArray array ];
    for (NSInteger i = 0 ; i < options.length; i++) {
        NSRange range   = NSMakeRange(i, 1);
        NSString * temp = [options substringWithRange:range];
        [optionCharArray addObject:temp];
    }
    //打乱数组
    NSMutableArray * newOptionArray = [self disorganizeArray:optionCharArray];
    //newOptionArray 显示到 上面
    for (NSInteger i = 0 ; i < optionButtonCount; i++) {
        UIButton * btn = self.optionsView.subviews[i];
        [btn setTitle:newOptionArray[i] forState:UIControlStateNormal];
    }
    
}

/**
 *  btn.frame 移动的时候始终是相对于父View进行计算的
 *  如果一个控件要移出自己的父View 那么坐标怎么算
 *  点击 optionButton 的时候，移动被点击的button到指定位置：
 *  判断 显示的位置的第一个button中是否有文字 如果没有把这个button移动到那个位置
 *  重点：optionView 中的button 移动位置 是相对于 optionView的origin
 *       answerView 中的button 移动位置 是相对于 answerView的origin
 *       控件的移动是相对于 控件的父View的，所有要把控件的移动前的坐标，和控件移动后的坐标都转化成已控件的父View为中心的坐标
 */
-(void)optionButtonClick:(UIButton *)sender{
    NSInteger answerViewBtnCount = self.answerView.subviews.count;
    for (NSInteger i = 0; i < answerViewBtnCount ; i++) {
        UIButton * btn =  self.answerView.subviews[i];
        if ( [btn.currentTitle isEqual:@""] || btn.currentTitle == nil ) {
            //把当前的sender的frame保存下来，
            CGPoint origin  = sender.frame.origin;
            CGSize  size    = sender.frame.size;
            ButtonFrameWithTag * oldBtn = [[ButtonFrameWithTag alloc]initWithX:origin.x Y:origin.y width:size.width height:size.height];
            NSNumber *obt   = [NSNumber numberWithInteger:sender.tag];
            [self.oldBtnFrames setObject:oldBtn forKey:obt];
            
            // 1.得到目标位置的 相对于屏幕的 x，y
            NSInteger targetX_window    = btn.frame.origin.x;
            NSInteger targetY_window    = btn.frame.origin.y + self.answerView.frame.origin.y;
            // 2.控件的父View的 相对于屏幕的 x ,y
            NSInteger superViewX_window = sender.superview.frame.origin.x;
            NSInteger superViewY_window = sender.superview.frame.origin.y;
            // 3.得到目标控件的相对 superView 的坐标
            NSInteger relativeX         = targetX_window - superViewX_window;
            NSInteger relativeY         = targetY_window - superViewY_window;
            // 4.得到目标控件的宽高
            NSInteger targetWidth       = btn.frame.size.width;
            NSInteger targetHeight      = btn.frame.size.height;
            // 5.生成一个相对于superView的rect
            CGRect newSenderRect        = CGRectMake(relativeX, relativeY, targetWidth, targetHeight);

            [UIView animateWithDuration:0.6 animations:^{
                sender.frame = newSenderRect;
            } completion:^(BOOL finished) {
                //每次点击optionBtn 都有可能 该判断答案了：到底什么时候去判断答案呢
                //答案是有长度的，当本次循环的次数达到答案的长度的时候说明该 去判断了。
                if (i == answerViewBtnCount - 1) {
                    NSString * tempAnswer   = @"";
                    for (int i = 0; i < answerViewBtnCount; i++) {
                        UIButton * btn      = self.answerView.subviews[i];
                        NSString * btntitle = btn.currentTitle;
                        tempAnswer          = [tempAnswer stringByAppendingString:btntitle];
                        
                    }
                    //判断和答案是否一致
                    BusinessStartsModel * model = self.models[_index];
                    NSString * answer           = model.answer;
                    if ([answer isEqualToString:tempAnswer]) {
                        // todo 一些恭喜之类的动画
                        [NSThread sleepForTimeInterval:0.5f];
                        [self nextQustion:nil];
                    }else{
                        // 把所有的文字都变成 红色
                        for (NSNumber * answerBtnTag in self.answerBtnWithOptionBtnTag) {
                            NSNumber * optionBtnTag = self.answerBtnWithOptionBtnTag[answerBtnTag];
                            NSInteger tag           = [optionBtnTag intValue];
                            UIButton * btn          = [self.optionsView viewWithTag:tag];
                            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal ];
                        }
                    }
                }
            }];
            
            //执行动画之后 要给btn的currentTitle赋值 这样再次点击下一个option按钮的时候 判断下一个answer按钮
            [btn setTitle:sender.currentTitle forState:UIControlStateNormal];
            //把sender的tag 和 btn.tag 绑定在一起
            NSNumber *answerBtnTag = [NSNumber numberWithInteger:btn.tag];
            NSNumber *optionBtnTag = [NSNumber numberWithInteger:sender.tag];
            [self.answerBtnWithOptionBtnTag setObject:optionBtnTag forKey:answerBtnTag ];
            
            return;
        }else{
            continue;
        }
    }
}

/**
 *  打散数组的方法
 */
-(NSMutableArray *)disorganizeArray:(NSMutableArray *)array{
    NSMutableArray * newArray = [NSMutableArray array];
    while (array.count > 0) {
        //1.根据数组的长度 获得一个随机数
        NSInteger randomPositon = arc4random() % array.count ;
        NSString * randomStr    = array[randomPositon];
        [newArray addObject:randomStr];
        [array removeObjectAtIndex:randomPositon];
    }
    return newArray;
}

- (IBAction)imageBtnClick:(UIButton *)sender {
    if (_isBigImage) {                                  //执行缩小的动画
        [self shrink];
    }else{                                              //执行放大的动画
        [self magnify];
    }
}

/**
 *  放大动画
 */
- (void) shrink{
    [UIView animateWithDuration:0.6 animations:^{
        self.BusinessStarImage.frame = self.smallImageFrame;
        [self.shadow setAlpha:0.0];
    }];
    _isBigImage = NO;
}

/**
 *  缩小动画
 */
-(void)magnify{
    [UIView animateWithDuration:0.6 animations:^{
        self.BusinessStarImage.frame = self.bigImageFrame;
        [self.shadow setAlpha:0.6];
    }];
    _isBigImage = YES;
}

/**
 *  大图图标呗点击
 */
- (IBAction)magnifyImage:(UIButton *)sender {
    [self magnify];
}

/**
 *  背景图被点击的时候
 */
- (IBAction)shadowClick:(UIButton *)sender {
    if (_isBigImage) {
        //执行缩小动画
        [self shrink];
    }
}

@end
