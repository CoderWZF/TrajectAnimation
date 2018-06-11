//
//  TrajectoryView.h
//  TrajectoryAnimation
//
//  Created by wuzaifeng on 2017/6/23.
//  Copyright © 2017年 wuzaifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrajectoryView : UIView

- (instancetype)initWithParentView:(UIView*)parentView;
- (void)startAnimation ;
- (void)stopAnimation;

@end
