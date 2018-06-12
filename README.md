# 轨迹动画的简单实现

**Example:**

```
TrajectoryView *trajectoryView = [[TrajectoryView alloc] initWithParentView:_demoView];
trajectoryView.borderColor = [UIColor redColor];
trajectoryView.borderWidth = 10;
trajectoryView.animationDuration = 2;
[trajectoryView startAnimation];
    
//模拟2s后，停止动画
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [trajectoryView stopAnimation];
    });
```


**Result:**

![GitHub set up](https://github.com/CoderWZF/TrajectAnimation/blob/master/1.gif)






