//
//  JGView.m
//  TestLine
//
//  Created by 郭军 on 2019/5/31.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGView.h"

@implementation JGView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor cyanColor];

        
    }
    return self;
}


/**
 画线
 */
- (void)drawLine {
    
    //获取图形上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //路径设置
    CGContextMoveToPoint(contextRef, 10, 30);
    CGContextAddLineToPoint(contextRef, self.frame.size.width - 20, 30);
    
    //设置样式
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    
    CGContextSetLineCap(contextRef, kCGLineCapRound);
    
    /*
     画虚线
     参数1 作用域
     参数2 起点的偏移量
     参数3 指明虚线是如何交替绘制
     lengths的值｛10,10｝表示先绘制10个点，再跳过10个点
     如果把lengths值改为｛10, 20, 10｝，则表示先绘制10个点，跳过20个点，绘制10个点，跳过10个点，再绘制20个点，
     参数4 实心部分和虚心部分的循环次数
     */
//    CGFloat lengths[] = {10,10};
//    CGContextSetLineDash(contextRef, 0, lengths, 2);
    
    //渲染
    CGContextStrokePath(contextRef);
}


/**
 画三角形
 */
- (void)drawTriangle{
 
    //获取图像上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //设置点
    CGContextMoveToPoint(contextRef, 10, 50);
    CGContextAddLineToPoint(contextRef, 100, 80);
    CGContextAddLineToPoint(contextRef, 40, 120);
    CGContextClosePath(contextRef);
    
    //设置线宽
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    //设置填充颜色
    CGContextSetFillColorWithColor(contextRef, [UIColor greenColor].CGColor);
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}


/**
 画正方形
 */
- (void)drawSquare {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(contextRef, CGRectMake(110, 50, 60, 60));
    
    //颜色
    CGContextSetFillColorWithColor(contextRef, [UIColor greenColor].CGColor);
    
    //线宽
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    
    //渲染
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}

/**
 画圆
 */
- (void)drawRound {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextAddEllipseInRect(contextRef, CGRectMake(180, 50, 60, 60));
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}


/**
 扇形
 */
- (void)drawArc {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    /*
     参数1:作用域
     参数2:圆心x坐标
     参数3:圆心y坐标
     参数4:半径
     参数5:开始角度
     参数6:结束角度
     参数7:方向，0表示顺时针，1表示逆时针
     */
    CGContextAddArc(contextRef, 280, 75, 25, M_PI,  M_PI_2, 0);
    
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextSetFillColorWithColor(contextRef, [UIColor greenColor].CGColor);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor redColor].CGColor);
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}

/**
 扇形
 */
- (void)drawArc2 {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    //第一部分
    CGContextMoveToPoint(contextRef, 350, 75);
    CGContextAddArc(contextRef, 350, 75, 25, 0, M_PI_2, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor blueColor].CGColor);
    CGContextFillPath(contextRef);
    
    //第二部分
    CGContextMoveToPoint(contextRef, 350, 75);
    CGContextAddArc(contextRef, 350, 75, 25, M_PI_2, M_PI_2 / 2 * 3, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor orangeColor].CGColor);
    CGContextFillPath(contextRef);
    
    //第三部分
    CGContextMoveToPoint(contextRef, 350, 75);
    CGContextAddArc(contextRef, 350, 75, 25, M_PI_2 / 2 * 3, 225*M_PI/180.0, 0);
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextFillPath(contextRef);
}



/**
 画曲线
 */
- (void)drawCurve {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(contextRef, 30, 230);
    
    /*
     三阶贝塞尔曲线
     参数1:作用域
     参数2:控制点x
     参数3:控制点y
     参数4:控制点x
     参数5:控制点y
     参数6:终点x
     参数7:终点y
     
     - `CGContextAddQuadCurveToPoint`  二阶贝塞尔曲线
     */
    CGContextAddCurveToPoint(contextRef, 40, -10, 100, 280, 150, 190);
    CGContextStrokePath(contextRef);
}



/**
 画特效
 */
- (void)PaintingEffects {
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    
    CGContextAddRect(contextRef, CGRectMake(190, 150, 100, 100));
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGContextSetStrokeColorWithColor(contextRef, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(contextRef, 5.0f);
    
    //设置透明度
    //取值范围（0~1，0表示全透明，1是不透明）
    CGContextSetAlpha(contextRef, 1);
    
    /*
     设置阴影
     参数1:画布
     参数2:右偏移量
     参数3:下偏移量
     参数4:模糊度（0是不模糊，越大越模糊，10就差不多）
     */
    CGContextSetShadow(contextRef, CGSizeMake(10, 10), 10);
    
    CGContextDrawPath(contextRef, kCGPathFillStroke);
}



/**
 绘制文字
 */
- (void)drawText {
    
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:15],
                          NSForegroundColorAttributeName : [UIColor redColor]
                          };
    // 两种的区别drawInRect会自动换行，drawAtPoint:CGPointZero不会自动换行
    [@"这是绘制的文字" drawInRect:CGRectMake(20, 270, 200, 50) withAttributes:dic];
}


/**
  绘制图片
 */
- (void)drawPicture {
    
    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    [image drawInRect:CGRectMake(20, 310, 100, 100)];
    // 平铺图像，超出部分会自动剪裁
    //    [image drawAsPatternInRect:self.bounds];
    // 如果实现文字和图片共存，需要将文字写在后面，防止被图片盖住
    NSDictionary *dic = @{
                          NSFontAttributeName:[UIFont systemFontOfSize:15],
                          NSForegroundColorAttributeName : [UIColor yellowColor]
                          };
    NSString *text = @"如果实现文字和图片共存，需要将文字写在后面，防止被图片盖住";
    [text drawInRect:CGRectMake(20, 310, 100, 100) withAttributes:dic];
}


/**
 裁剪图片
 */
-(void)clipImage {
    
    /*
     思路：先画一个圆，让图片显示在圆的内部，超出的部分不显示。
     注意：显示的范围只限于指定的剪切范围，无论往上下文中绘制什么东西，只要超出了这个范围的都不会显示。
     */
    
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    // 先画一个圆形
    CGContextAddEllipseInRect(contextRef, CGRectMake(150, 310, 100, 100));
    
    // 切割操作
    CGContextClip(contextRef);
    CGContextFillPath(contextRef);
    
    
    UIImage *image = [UIImage imageNamed:@"2.jpg"];
    [image drawInRect:CGRectMake(150, 310, 100, 100)];
}




- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    //1、画线
    [self drawLine];
    
    //2、画三角形
    [self drawTriangle];
    
    //3、画正方形
    [self drawSquare];
    
    //4、画圆
    [self drawRound];
    
    //5、扇形
    [self drawArc];
    [self drawArc2];

    //6、 画曲线
     [self drawCurve];
    
    //7、 画特效
    [self PaintingEffects];
    
    //8、 绘制文字
    [self drawText];

    //9、 绘制图片
    [self drawPicture];
    
    //10、裁剪图片
    [self clipImage];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
