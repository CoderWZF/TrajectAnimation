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
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TrajectoryView *view = [[TrajectoryView alloc] initWithParentView:_demoView];
    [view startAnimation];
}



@end
