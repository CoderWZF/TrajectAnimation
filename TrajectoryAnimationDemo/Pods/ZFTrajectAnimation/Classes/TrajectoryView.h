//
//  TrajectoryView.h
//  TrajectoryAnimation
//
//  Created by wuzaifeng on 2017/6/23.
//  Copyright © 2017年 wuzaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrajectoryView : UIView

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat animationDuration;

- (instancetype)initWithParentView:(UIView*)parentView;
- (void)startAnimation ;
- (void)stopAnimation;

@end
