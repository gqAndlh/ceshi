//
//  ViewController.m
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scr=[[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scr];
    
    UIImage *image = [UIImage imageNamed:@"NC_back"];
    CGFloat top = 300; // 顶端盖高度
    CGFloat bottom = 300 ; // 底端盖高度
    CGFloat left = 0; // 左端盖宽度
    CGFloat right = 0; // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    image=[image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 2000)];
    img.image=image;
    [scr addSubview:img];
    scr.contentSize=CGSizeMake(SCREEN_WIDTH, 2000);
    
    
    
    
//    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 200)];
//    img.image=[UIImage imageNamed:@"ripe"];
//    [self.view addSubview:img];
    
//    //1, 创建核心动画
//    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
//    //2, 告诉系统执行什么动画。
//    keyAnima.keyPath = @"transform.rotation";
//    keyAnima.values = @[@(-M_PI_4 /180.0 * 5),@(M_PI_4 /180.0 * 5),@(-M_PI_4 /180.0 * 5)];
//    //  3, 执行完之后不删除动画
//    keyAnima.removedOnCompletion = NO;
//    // 4, 执行完之后保存最新的状态
//    keyAnima.fillMode = kCAFillModeForwards;
//    // 5, 动画执行时间
//    keyAnima.duration = 0.2;
//    // 6, 设置重复次数。
//    keyAnima.repeatCount = MAXFLOAT;
//    // 7, 添加核心动画
//    [img.layer addAnimation:keyAnima forKey:nil];
//    float rand=(float)random();
//        CFTimeInterval t=rand*0.0000000001;
//
//        [UIView animateWithDuration:0.5 delay:t options:0  animations:^
//         {
//            img.transform=CGAffineTransformMakeRotation(-0.01);
//         } completion:^(BOOL finished)
//         {
//             [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction  animations:^
//              {
//                 img.transform=CGAffineTransformMakeRotation(0.01);
//              } completion:^(BOOL finished) {}];
//         }];
    
    
    // Do any additional setup after loading the view.
}


@end
