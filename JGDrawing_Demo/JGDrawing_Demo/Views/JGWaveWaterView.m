//
//  JGWaveWaterView.m
//  JGDrawing_Demo
//
//  Created by 郭军 on 2019/6/1.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGWaveWaterView.h"

@implementation JGWaveWaterView {
    CGFloat a;
    CGFloat w;
    CGFloat φ;
    CGFloat k;
    
    
    CGFloat viewHeight;
    CGFloat viewWidth;
    
    CGFloat speed;
    
    CADisplayLink *displayLink;
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initData];
        self.backgroundColor = [UIColor clearColor];
        
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveAnimation)];
        [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}


#pragma mark - 初始化
- (void)initData {
    viewWidth = self.bounds.size.width;
    viewHeight = self.bounds.size.height;
    
    a = viewHeight/20;
    w = 2*M_PI/(viewWidth*0.9);
    
    speed = 0.08;
}

- (void)drawRect:(CGRect)rect {
    [self drawStar];
    [self drawWave];
}


#pragma mark - 五角星
- (void)drawStar {
    UIBezierPath *star = [UIBezierPath bezierPath];
    //确定中心点
    CGPoint centerPoint = CGPointMake(viewWidth/2, viewWidth/2);
    //确定半径
    CGFloat bigRadius = viewWidth/2;
    CGFloat smallRadius = bigRadius * sin(2*M_PI/20) / cos(2*M_PI/10);
    //起始点
    CGPoint start=CGPointMake(viewWidth/2, 0);
    [star moveToPoint:start];
    
    
    //五角星每个顶角与圆心连线的夹角 2π/5，
    CGFloat angle=2*M_PI/5.0;
    for (int i=1; i<=10; i++) {
        CGFloat x;
        CGFloat y;
        NSInteger c = i/2;
        if (i%2 == 0) {
            x=centerPoint.x-sinf(c*angle)*bigRadius;
            y=centerPoint.y-cosf(c*angle)*bigRadius;
        } else {
            x=centerPoint.x-sinf(c*angle + angle/2)*smallRadius;
            y=centerPoint.y-cosf(c*angle + angle/2)*smallRadius;
        }
        [star addLineToPoint:CGPointMake(x, y)];
    }
    
    //连接点
    star.lineJoinStyle = kCGLineJoinRound;
    //虚线
    CGFloat pattern[] = {2.0,2.0};
    [star setLineDash:pattern count:2 phase:0];
    //填充颜色色
    [[UIColor lightGrayColor] setFill];
    [star fill];
    //描边颜色
    [[UIColor redColor] setStroke];
    [star stroke];
    //剪切当前画布区域，之后的绘图都在该区域中进行
    [star addClip];
}

#pragma mark - 绘制波纹
- (void)drawWave {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    for (CGFloat x = 0.0; x <= viewWidth; x ++) {
        CGFloat y = a*sin(w*x + φ) + (1-_progress)*(viewHeight + 2*a);
        if (x == 0) {
            //起始点
            [path moveToPoint:CGPointMake(x, y - a)];
        } else {
            [path addLineToPoint:CGPointMake(x, y - a)];
        }
    }
    //闭合path
    [path addLineToPoint:CGPointMake(viewWidth, viewHeight)];
    [path addLineToPoint:CGPointMake(0, viewHeight)];
    [path closePath];
    
    [[UIColor redColor] setFill];
    [path fill];
}


#pragma mark - animation
- (void)waveAnimation {
    φ += speed;
    [self setNeedsDisplay];
}


-(void)setProgress:(CGFloat)progress {
    _progress = progress;
    [self setNeedsDisplay];
}


- (void)dealloc {
    [displayLink invalidate];
    displayLink = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
