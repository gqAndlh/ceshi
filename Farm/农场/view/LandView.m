//
//  LandView.m
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import "LandView.h"

@implementation LandView

- (void)setIndex:(int)index{
    
    if ((index/2)%2==0) {
        _noripe.hidden=NO;
        _ripe.hidden=YES;
        _bean.hidden=YES;
    }else{
        _noripe.hidden=YES;
        _ripe.hidden=NO;
        _bean.hidden=NO;
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ClickView:)];
        [_ripe addGestureRecognizer:tap];
        [self ImageSpring];
    }
    if (index>30) {
        _land.image=[UIImage imageNamed:@"land"];
        _ripe.hidden=YES;
        _bean.hidden=YES;
        _noripe.hidden=YES;
        _boor.hidden=YES;
    }
    if (index > 60) {
        _land.image=[UIImage imageNamed:@"NO_land"];
        _ripe.hidden=YES;
        _bean.hidden=YES;
        _noripe.hidden=YES;
        _boor.hidden=YES;
    }
    
}
-(void)ClickView:(UITapGestureRecognizer *)tap{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];

    animation.duration = 0.3;// 动画时间

    NSMutableArray *values = [NSMutableArray array];

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];

    // 这三个数字，我只研究了前两个，所以最后一个数字我还是按照它原来写1.0；前两个是控制view的大小的；

    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1, 1.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1.0)]];

    animation.values = values;

    [self.ripe.layer addAnimation:animation forKey:nil];


//    [UIView animateKeyframesWithDuration:0.2 delay:0 options:0 animations: ^{
//
//        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations: ^{
//
//            self.ripe.transform = CGAffineTransformMakeScale(1.2,1.2);
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations: ^{
//            self.ripe.transform = CGAffineTransformMakeScale(1.0,1.0);
//
//        }];
//
//    } completion:nil];
}
//云豆漂浮
- (void)ImageSpring {
    [UIView animateWithDuration:0.5 animations:^{
        _bean.frame = CGRectMake(_bean.frame.origin.x, _bean.frame.origin.y+5, 40, 40);
    }];
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _bean.frame = CGRectMake(_bean.frame.origin.x, _bean.frame.origin.y-5, 40, 40);
    } completion:^(BOOL finished) {
        [self ImageSpring];
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
