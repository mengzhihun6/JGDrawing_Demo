//
//  JGOneController.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGOneController.h"
#import "JGWaveWaterView.h"


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



@interface JGOneController ()
@property (nonatomic, strong)UIBezierPath *path;
@property (nonatomic, strong)JGWaveWaterView *water;

@end

@implementation JGOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self clipView];
//    [self clipImage];

    
    [self DrawPicture];
    [self drawWater];
}


- (void)drawWater {
    
    _water = [[JGWaveWaterView alloc] initWithFrame:CGRectMake(180, 0, 200, 200)];
    _water.center = self.view.center;
    _water.progress = .5;
    [self.view addSubview:_water];
    
}



- (void)TapClick:(UITapGestureRecognizer *)tap {
    
    CGPoint point = [tap locationInView:tap.view];
    
    //    NSLog(@"TapClick--------%@", NSStringFromCGPoint(point));
    
    if(CGPathContainsPoint(self.path.CGPath, NULL, point, NO)){
        
        tap.view.backgroundColor = [UIColor redColor];
        
        [UIView animateWithDuration:0.1 animations:^{
            tap.view.backgroundColor = [UIColor yellowColor];
        }];
        
        
        NSLog(@"TapClick==在区域内");
    }else{
        
        NSLog(@"TapClick--------不在区域内");
    }
}




- (void)DrawPicture {
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake( 50, 30, 100, 100)];
    backView.backgroundColor = [UIColor yellowColor];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapClick:)];
    tap.numberOfTapsRequired = 1;
    [backView addGestureRecognizer:tap];
    
    
    [self.view addSubview:backView];
    
    
    //使用贝塞尔画五角星  （此处不详细讲贝塞尔的使用）
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(34.5, 11)];
    [starPath addLineToPoint: CGPointMake(46.31, 25.41)];
    [starPath addLineToPoint: CGPointMake(66.36, 30.35)];
    [starPath addLineToPoint: CGPointMake(53.62, 44.19)];
    [starPath addLineToPoint: CGPointMake(54.19, 61.65)];
    [starPath addLineToPoint: CGPointMake(34.5, 55.8)];
    [starPath addLineToPoint: CGPointMake(14.81, 61.65)];
    [starPath addLineToPoint: CGPointMake(15.38, 44.19)];
    [starPath addLineToPoint: CGPointMake(2.64, 30.35)];
    [starPath addLineToPoint: CGPointMake(22.69, 25.41)];
    [starPath closePath];//封闭
    
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:starPath.CGPath];
    self.path = path;
    
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = backView.bounds;
    masklayer.path = path.CGPath;//设置路径
    backView.layer.mask = masklayer;
}




- (void)clipView
{
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor yellowColor];
    
    // 半径
    CGFloat r = (SCREEN_WIDTH*0.5*SCREEN_WIDTH*0.5 + 80.0*80.0)/(2.0*80.0);
    
    UIBezierPath *path0 = [UIBezierPath bezierPathWithRect:CGRectMake(0, 80.0, SCREEN_WIDTH, SCREEN_HEIGHT-80.0)];
    
    [path0 addArcWithCenter:CGPointMake(SCREEN_WIDTH*0.5, r) radius:r startAngle:5/4.0*M_PI endAngle:8/4.0*M_PI clockwise:YES];
    
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = backView.bounds;
    masklayer.path = path0.CGPath;//设置路径
    backView.layer.mask = masklayer;
    
    [self.view addSubview:backView];
}




- (void)clipImage
{
    UIImage *textImage = [UIImage imageNamed:@"2.jpg"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:textImage];
    
    imageView.frame = self.view.bounds;
    
    // 半径
    CGFloat r = (SCREEN_WIDTH*0.5*SCREEN_WIDTH*0.5 + 80.0*80.0)/(2.0*80.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 80.0, SCREEN_WIDTH, SCREEN_HEIGHT-80.0)];
    
    [path addArcWithCenter:CGPointMake(SCREEN_WIDTH*0.5, r) radius:r startAngle:5/4.0*M_PI endAngle:8/4.0*M_PI clockwise:YES];
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO, 0);
    
    [path addClip];
    
    // 绘制图片
    [textImage drawInRect:imageView.frame];
    
    // 获取当前图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    
    UIGraphicsEndImageContext();
    
    imageView.image = image;
    
    [self.view addSubview:imageView];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
