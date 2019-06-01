//
//  JGCGContextRefView.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGCGContextRefView.h"
#import <QuartzCore/QuartzCore.h>
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

@implementation JGCGContextRefView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)setsubViews {
    //创建上下文
}

- (void)drawRect:(CGRect)rect {
    //获取当前CGContextRef 只有在此方法中能直接获取当前的CGContextRef
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //    //第一条线
    //    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    //    CGContextSetLineWidth(ctx, 2.0f);
    //    CGContextMoveToPoint(ctx, 10, 30);
    //    CGContextAddLineToPoint(ctx, 10, 100);
    //    CGContextStrokePath(ctx);
    //
    //    //第二条线
    //    CGContextSaveGState(ctx); //   ----- 看这里
    //    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    //    CGContextSetLineWidth(ctx, 5.0f);
    //    CGContextMoveToPoint(ctx, 50, 30);
    //    CGContextAddLineToPoint(ctx, 50, 100);
    //    CGContextStrokePath(ctx);
    //    CGContextRestoreGState(ctx); // ---- 看这里
    //
    //    //第三条线
    //    CGContextMoveToPoint(ctx, 110, 30);
    //    CGContextAddLineToPoint(ctx, 110, 100);
    //    CGContextStrokePath(ctx);
    
    //设置填充颜色
    CGContextSetRGBFillColor(ctx, 255/255.0, 175/255.0, 40/255.0, 1.0);
    //增加字体属性
    NSDictionary *mDict = @{NSForegroundColorAttributeName:[UIColor cyanColor], NSFontAttributeName:[UIFont systemFontOfSize:16.0]};
    [@"画圆形：" drawInRect:CGRectMake(10, 20 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"画线和弧线：" drawInRect:CGRectMake(10, 80 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"画矩形：" drawInRect:CGRectMake(10, 130 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"画图形：" drawInRect:CGRectMake(10, 260 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"画贝塞尔曲线：" drawInRect:CGRectMake(10, 350 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"图片:" drawInRect:CGRectMake(10, 400 + kStatusBarHeight, 100, 20) withAttributes:mDict];
    [@"画虚线:" drawInRect:CGRectMake(10, 460 + kStatusBarHeight, 100, 20) withAttributes:mDict];
#pragma mark ========== 画圆形 ==========
    //边框圆形
    CGContextSetRGBStrokeColor(ctx, 200/255.0, 175/255.0, 40/255.0, 1.0);//画笔线的颜色
    CGContextSetLineWidth(ctx, 2.0);//线条宽度
    /*
     void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise);
     参数：x,y为圆点坐标，radius半径，startAngle为开始的角度，endAngle为 结束的角度，clockwise 0为顺时针，1为逆时针。
     */
    CGContextAddArc(ctx, 100, kStatusBarHeight + 30, 20, 0, M_PI*2, 0);//添加一个圆
    CGContextDrawPath(ctx, kCGPathStroke);//绘制路径
    /*
     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
     kCGPathStroke:只有边框
     kCGPathFillStroke：既有边框又有填充（有边框颜色 和 填充颜色）
     kCGPathEOFillStroke：奇偶填充并绘制边框
     */
    //填充圆形
    CGContextSetRGBFillColor(ctx, 255/255.0, 175/255.0, 40/255.0, 1.0);
    CGContextAddArc(ctx, 160, kStatusBarHeight + 30, 20, 0, 2*M_PI, 0);
    CGContextDrawPath(ctx, kCGPathFill);
    //画有边框的实体圆形
    CGContextSetRGBStrokeColor(ctx, 200/255.0, 175/255.0, 40/255.0, 1.0);
    CGContextSetRGBFillColor(ctx, 255/255.0, 175/255.0, 40/255.0, 1.0);
    CGContextAddArc(ctx, 220, kStatusBarHeight + 30, 20, 0, M_PI*2, 0);
    CGContextSetLineWidth(ctx, 2);
    CGContextDrawPath(ctx, kCGPathFillStroke);//绘制路径和填充
#pragma mark ========== 画线，弧线 ==========
    //画线
    CGPoint myPoint[2];//坐标点
    myPoint[0] = CGPointMake(120, kStatusBarHeight + 30 + 40 + 20);
    myPoint[1] = CGPointMake(160, kStatusBarHeight + 30 + 40 + 20);
    CGContextAddLines(ctx, myPoint, 2);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextStrokePath(ctx);
    //画线2
    CGContextSetStrokeColorWithColor(ctx, [[UIColor greenColor] CGColor]);
    CGContextMoveToPoint(ctx, 160 +10, kStatusBarHeight + 30 + 40 + 20);
    CGContextAddLineToPoint(ctx, 160 + 10 + 40, kStatusBarHeight + 30 + 40 + 20);
    CGContextStrokePath(ctx);
    //画圆弧
    CGContextSetStrokeColorWithColor(ctx, [[UIColor greenColor] CGColor]);
    CGContextMoveToPoint(ctx, 160 + 10 + 40 + 10, kStatusBarHeight + 30 + 40 + 20);
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //参数：CGFloat x1 控制点的x坐标, CGFloat y1 控制点的y坐标,CGFloat x2 结束点的x坐标, CGFloat y2 结束点的y坐标, CGFloat radius 半径
    /*
     开始点的坐标为p1，控制点坐标为p2,结束点的的坐标为p3
     以p2为端点，发出两条射线，分别经过p1和p3，那么与两条射线相切的圆有无数个，若是给一个确定的半径，则可以确定一个圆。那么函数可以绘制两个切点之间的一段弧线
     1).若开始点和结束点正好在两个切点的位置，则绘制一条弧线。
     2).若开始点不是切点，则以开始点连一条直线到切点再绘制弧线。
     3).所以该函数需要确定好控制点 和 结束点的位置 及 半径的值
     4).上下文会自动以结束点为 current point。
     */
    //    CGContextAddLineToPoint(ctx, 160 + 10 + 40 + 10 + 40, kStatusBarHeight + 30 + 40 + 20);
    //    CGContextAddLineToPoint(ctx, 160 + 10 + 40 + 10 + 20, kStatusBarHeight + 30 + 40);
    CGContextAddArcToPoint(ctx, 160 + 10 + 40 + 10 + 20, kStatusBarHeight + 30 + 40, 160 + 10 + 40 + 10 + 40, kStatusBarHeight + 30 + 40 + 20, 30);
    CGContextStrokePath(ctx);
    
    //用CGContextMoveToPoint画一个圆角半径为10的矩形
    //左
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextMoveToPoint(ctx, 300, 80);
    CGContextAddArcToPoint(ctx, 300, 120, 310, 120, 10);
    CGContextStrokePath(ctx);
    //下
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextMoveToPoint(ctx, 310, 120);
    CGContextAddArcToPoint(ctx, 340, 120, 340, 110, 10);
    CGContextStrokePath(ctx);
    //右
    CGContextMoveToPoint(ctx, 340, 110);
    CGContextAddArcToPoint(ctx, 340, 70, 330, 70, 10);
    CGContextStrokePath(ctx);
    //上
    CGContextMoveToPoint(ctx, 330, 70);
    CGContextAddArcToPoint(ctx, 300, 70, 300, 80, 10);
    CGContextStrokePath(ctx);
    //画矩形
    CGContextSetLineWidth(ctx, 2);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    CGContextStrokeRect(ctx, CGRectMake(100, kStatusBarHeight + 100, 50, 50));
    
    CGContextSetLineWidth(ctx, 2);
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextFillRect(ctx, CGRectMake(100 + 60, kStatusBarHeight + 100, 50, 50));
    
    CGContextSetLineWidth(ctx, 1);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor blackColor] CGColor]);
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextAddRect(ctx, CGRectMake(100 + 60 + 60, kStatusBarHeight + 100, 50, 50));
    CGContextDrawPath(ctx, kCGPathFillStroke);
#pragma mark ========== 扇形，椭圆，多边形 ==========
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    UIColor *aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGContextSetFillColorWithColor(ctx, aColor.CGColor);//填充颜色
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    
    //以10为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(ctx, 100, 290);
    CGContextAddArc(ctx, 100, 290, 30,  -60 * M_PI / 180, -120 * M_PI / 180, 1);
    //    CGContextClosePath(ctx);//闭合图形
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //画椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(130, 260, 40, 20));
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3]; //坐标点
    sPoints[0] = CGPointMake(180, 290);//坐标1
    sPoints[1] = CGPointMake(210, 290);//坐标2
    sPoints[2] = CGPointMake(240, 230);//坐标3
    CGContextAddLines(ctx, sPoints, 3);//添加线
    CGContextClosePath(ctx);//封起来
    CGContextDrawPath(ctx, kCGPathFillStroke); //根据坐标绘制路径
    
    //不规则五边形
    CGPoint myPoints[5]; //坐标点
    myPoints[0] = CGPointMake(250, 300);//坐标1
    myPoints[1] = CGPointMake(280, 300);//坐标2
    myPoints[2] = CGPointMake(280, 240);//坐标3
    myPoints[3] = CGPointMake(250, 240);//坐标4
    myPoints[4] = CGPointMake(265, 270);//坐标5
    CGContextAddLines(ctx, myPoints, 5);//添加线
    CGContextClosePath(ctx);//封起来
    CGContextDrawPath(ctx, kCGPathFillStroke); //根据坐标绘制路径
    
    //使用贝塞尔画五角星  （此处不详细讲贝塞尔的使用）
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(314.5, 241)];
    [starPath addLineToPoint: CGPointMake(326.31, 255.41)];
    [starPath addLineToPoint: CGPointMake(346.36, 260.35)];
    [starPath addLineToPoint: CGPointMake(333.62, 274.19)];
    [starPath addLineToPoint: CGPointMake(334.19, 291.65)];
    [starPath addLineToPoint: CGPointMake(314.5, 285.8)];
    [starPath addLineToPoint: CGPointMake(294.81, 291.65)];
    [starPath addLineToPoint: CGPointMake(295.38, 274.19)];
    [starPath addLineToPoint: CGPointMake(282.64, 260.35)];
    [starPath addLineToPoint: CGPointMake(302.69, 255.41)];
    [starPath closePath];//封闭
    [[UIColor cyanColor] setFill];
    [starPath fill];//填充颜色
    
#pragma mark ========== 二次曲线,三次曲线 ==========
    CGContextMoveToPoint(ctx, 120, 350);
    //设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextAddQuadCurveToPoint(ctx, 150, 305, 180, 350);
    CGContextStrokePath(ctx);
    //
    CGContextMoveToPoint(ctx, 200, 350);
    CGContextAddCurveToPoint(ctx, 250, 330, 220, 400, 280, 320);
    CGContextStrokePath(ctx);
#pragma mark ========== 画虚线 ==========
    CGContextSetLineWidth(ctx, 2);
    CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
    //lengths的值｛10,10｝表示先绘制10个点的长度，再跳过10个点的长度，如此反复
    CGFloat lengths[] = {10, 10};
    //注意：如果对上下文进行了修改之后的所有连线的类型都默认为虚线啦！其他属性也一并如此。
    //设置线条起点和终点的样式为圆角
    CGContextSetLineCap(ctx, kCGLineCapRound);
    /*
     CGContextSetLineDash(CGContextRef  _Nullable c, CGFloat phase, const CGFloat * _Nullable lengths, size_t count);
     参数：
     CGFloat phase:绘制第一个虚线点时先减去该数值的长度。
     size_t count：必须和lengths数组长度匹配。
     */
    CGContextSetLineDash(ctx, 5, lengths, 2);
    
    CGContextMoveToPoint(ctx, 0, 520);
    CGContextAddLineToPoint(ctx, self.frame.size.width - 3, 520);
    CGContextStrokePath(ctx);
    
    CGContextSetLineWidth(ctx, 2.0);
    CGFloat lengths1[] = {10,10,5};//第一个数为实线长，第二个为空隙长度，第三个实线长度，第四个空隙长度，三个数一直循环
    CGContextSetLineDash(ctx, 0, lengths1, 3);
    CGContextMoveToPoint(ctx, 0, 550);
    CGContextAddLineToPoint(ctx, self.frame.size.width,550);
    CGContextStrokePath(ctx);
    
    
    /*图片*/
    UIImage *image = [UIImage imageNamed:@"icon_6.jpeg"];
    [image drawInRect:CGRectMake(60, 340 + 70, 60, 60)];//在坐标中画出图片
    //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(ctx, CGRectMake(150, 340 + 70, 60, 60), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
    
    //    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
