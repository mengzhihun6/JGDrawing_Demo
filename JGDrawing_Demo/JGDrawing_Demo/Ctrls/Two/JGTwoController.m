//
//  JGTwoController.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGTwoController.h"
#import <QuartzCore/QuartzCore.h>

@interface JGTwoController ()

@end

@implementation JGTwoController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self draw];
    [self draw2];
    [self draw3];
    // Do any additional setup after loading the view.
}


#pragma mark ========== 使用CGPath绘图 ==========
- (void)draw {
    //开始图像绘制
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
    //创建CGMutablePathRef
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, &transform, CGRectMake(0, 0, 20, 20));
    CGPathAddEllipseInRect(path, &transform, CGRectMake(80, 0, 20, 20));
    CGPathMoveToPoint(path, &transform, 100, 50);
    CGPathAddArc(path, &transform, 50, 50, 50, 0, M_PI, NO);
    //将path添加到当前context
    CGContextAddPath(ctx, path);
    //设置绘图属性
    [[UIColor redColor] setStroke];
    //    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokePath(ctx);
    
    //获取当前context图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image;
    [self.view addSubview:imageView];
}

#pragma mark ========== 使用CGContextRef绘图 ==========
- (void)draw2 {
    //开始图像绘制
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //创建用于转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    CGContextTranslateCTM(ctx, 50, 200);
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 20, 20));//rect 的 width height 长款一样就是圆 不一样就是椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(80, 0, 20, 20));
    CGContextMoveToPoint(ctx, 100, 50);
    CGContextAddArc(ctx, 50, 50, 50, 0, M_PI, 0);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextSetLineWidth(ctx, 2);
    CGContextStrokePath(ctx);
    
    //获取当前context图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image;
    [self.view addSubview:imageView];
}

#pragma mark ========== 使用UIBezierPath绘图 ==========
- (void)draw3 {
    //开始图像绘制
    UIGraphicsBeginImageContext([UIScreen mainScreen].bounds.size);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    //画圆
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 20, 8)]];
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:CGRectMake(80, 0, 20, 8)]];
    [path moveToPoint:CGPointMake(100, 50)];
    //注意这里clockwise参数是YES而不是NO，因为这里不是Quartz，不需要考虑Y轴翻转的问题 clockwise = YES 逆时针
    [path addArcWithCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:M_PI clockwise:YES];
    //使用applyTransform函数来转移坐标的Transform，这样我们不用按照实际显示做坐标计算
    [path applyTransform:CGAffineTransformMakeTranslation(50, 400)];
    
    [[UIColor blueColor] setStroke];
    [path setLineWidth:2];
    //执行绘画
    [path stroke];
    
    
    //获取当前context图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
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
