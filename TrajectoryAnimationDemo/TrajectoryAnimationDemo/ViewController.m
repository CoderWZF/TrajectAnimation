//
//  ViewController.m
//  TrajectoryAnimationDemo
//
//  Created by zaifeng wu on 2018/6/11.
//  Copyright © 2018年 zaifeng wu. All rights reserved.
//

#import "ViewController.h"
#import <ZFTrajectAnimation/TrajectoryView.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TrajectoryView *trajectoryView = [[TrajectoryView alloc] initWithParentView:_demoView];
    trajectoryView.borderColor = [UIColor redColor];
    trajectoryView.borderWidth = 10;
    trajectoryView.animationDuration = 2;
    [trajectoryView startAnimation];
    
    //模拟2s后，停止动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [trajectoryView stopAnimation];
    });
}



@end
