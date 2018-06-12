//
//  TrajectoryView.m
//  TrajectoryAnimation
//
//  Created by wuzaifeng on 2017/6/23.
//  Copyright © 2017年 wuzaifeng. All rights reserved.
//

#import "TrajectoryView.h"
@interface TrajectoryView ()
@property (nonatomic, assign) CGFloat cornerRaduis;
///需要给谁添加动画
@property (nonatomic, strong) UIView *parentView;
///动画
@property (nonatomic, strong) CABasicAnimation *animation;
///layer
@property (nonatomic, strong) CAShapeLayer *animitionLayer;
///path
@property (nonatomic, strong) UIBezierPath *linePath;
@end

@implementation TrajectoryView
///宽度
static const CGFloat kBorderWidth = 2.0;
///颜色
#define KBorderColor [UIColor redColor]
///动画时间
static const CGFloat KAnimationDuration = 5.0f;

#pragma mark -init
- (instancetype)initWithParentView:(UIView*)parentView {
    self = [super initWithFrame:parentView.frame];
    if (self) {
        self.cornerRaduis = parentView.layer.cornerRaduis;
        self.parentView = parentView;
        [parentView.superview insertSubview:self belowSubview:parentView];
    }
    return self;
}

#pragma mark -lazyLoad
- (CABasicAnimation *)animation {
    if (!_animation) {
        _animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _animation.duration = self.animationDuration ? self.animationDuration : KAnimationDuration;   // 持续时间
        _animation.fromValue = @(0); // 从 0 开始
        _animation.toValue = @(1);   // 到 1 结束
        // 保持动画结束时的状态
        _animation.removedOnCompletion = NO;
        _animation.fillMode = kCAFillModeForwards;
        // 动画缓慢的进入，中间加速，然后减速的到达目的地。
        _animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }
    return _animation;
}


- (UIBezierPath *)linePath {
    if (!_linePath) {
        if (_cornerRaduis) {
            _linePath = [UIBezierPath bezierPath]
        } else {
            //矩形从rect起点到终点
            CGFloat oriX = self.bounds.origin.x;
            CGFloat oriY = self.bounds.origin.y;
            CGFloat width = self.bounds.size.width;
            CGFloat height = self.bounds.size.height;
            _linePath = [UIBezierPath bezierPath];
            //移动到起点位置
            [_linePath moveToPoint:CGPointMake(oriX+width/2.0, oriY)];
            [_linePath addLineToPoint:CGPointMake(oriX+width, oriY)];
            [_linePath addLineToPoint:CGPointMake(oriX+width, oriY+height)];
            [_linePath addLineToPoint:CGPointMake(oriX, oriY+height)];
            [_linePath addLineToPoint:CGPointMake(oriX, oriY)];
            [_linePath closePath];
        }
    }
    return _linePath;
}


- (CAShapeLayer *)animitionLayer {
    if (!_animitionLayer) {
        _animitionLayer = [CAShapeLayer layer];
        _animitionLayer.path = self.linePath.CGPath;
        _animitionLayer.lineWidth = self.borderWidth : self.borderWidth : kBorderWidth;
        _animitionLayer.strokeColor = (self.borderColor ? self.borderColor : KBorderColor).CGColor;
    }
    return _animitionLayer;
}



#pragma mark -public
- (void)startAnimation {
    // 添加layer
    [self.layer addSublayer:self.animitionLayer];
    //给layer添加动画
    [self.animitionLayer addAnimation:self.animation forKey:@""];
}

- (void)stopAnimation {
    //移除动画
    [self.animitionLayer removeAllAnimations];
    //移除layer
    [self.animitionLayer removeFromSuperlayer];
    //移除View
    [self removeFromSuperview];
}



@end
