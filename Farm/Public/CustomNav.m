//
//  CustomNav.m
//  EasyPet
//
//  Created by loyo_gaoqiang on 2017/9/26.
//  Copyright © 2017年 高强. All rights reserved.
//

#import "CustomNav.h"

@interface CustomNav ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation CustomNav

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self.navigationBar setBarTintColor:MAINCOLOR];
////    //导航颜色
//    self.navigationBar.barTintColor=MAINCOLOR;
    
    [self.navigationBar setBackgroundImage:[PubLic_Class imageWithColor:MAINCOLOR] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]]; 
    //标题颜色
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
    
//    [self.navigationBar setBackgroundImage:[PubLic_Class imageWithColor:MAINCOLOR] forBarMetrics:UIBarMetricsDefault];
//
//
//    //滑动返回
//    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.interactivePopGestureRecognizer.delegate = self;
//        self.delegate = self;
//    }
//
//    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    backItem.tintColor=[UIColor blackColor];
    viewController.navigationItem.backBarButtonItem = backItem;
    [super pushViewController:viewController animated:animated];
}


//-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//
//        UIButton *btn = [[UIButton alloc] init];
//        [btn setTitle:@" 返回" forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
//
//        [btn sizeToFit];
//        // 让按钮内部的所有内容左对齐
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//
//        //设置内边距，让按钮靠近屏幕边缘
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
//
//        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
//        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//            self.interactivePopGestureRecognizer.enabled = false;
//        }
//    }
//    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view并调用viewController的viewDidLoad方法。可以在viewDidLoad方法中重新设置自己想要的左上角按钮样式
//    [super pushViewController:viewController animated:animated];
//}
//-(void)back
//{
//    [self popViewControllerAnimated:YES];
//}
//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    if (self.viewControllers.count == 1) {
//        self.interactivePopGestureRecognizer.enabled = false;
//    }else{
//        self.interactivePopGestureRecognizer.enabled = true;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
