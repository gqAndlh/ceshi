//
//  AppDelegate.m
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import "AppDelegate.h"
#import "FarmHome_Con.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    self.window.backgroundColor=[UIColor whiteColor];
//    CustomNav *nav=[[CustomNav alloc]initWithRootViewController:[FarmHome_Con new]];
//    self.window.rootViewController=nav;
    self.window.backgroundColor=[UIColor whiteColor];
    [self PushTabBar];
    return YES;
}
#pragma mark - 跳转tabbar
-(void)PushTabBar
{
    Home_Con *VC1 = [Home_Con new];
    Category_Con *VC2 = [Category_Con new];
    FarmHome_Con *VC3 = [FarmHome_Con new];
    ShopCar_Con *VC4 = [ShopCar_Con new];
    Me_Con *VC5 = [Me_Con new];

    VC1.tabBarItem.title=@"首页";
    VC2.tabBarItem.title=@"分类";
    VC3.tabBarItem.title=@"农场";
    VC4.tabBarItem.title=@"购物车";
    VC5.tabBarItem.title=@"我的";
    [VC1.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[PubLic_Class colorWithHexString:@"#52CBC4"]} forState:UIControlStateSelected];
    [VC2.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[PubLic_Class colorWithHexString:@"#52CBC4"]} forState:UIControlStateSelected];
    [VC3.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[PubLic_Class colorWithHexString:@"#52CBC4"]} forState:UIControlStateSelected];
    [VC4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[PubLic_Class colorWithHexString:@"#52CBC4"]} forState:UIControlStateSelected];
    [VC5.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[PubLic_Class colorWithHexString:@"#52CBC4"]} forState:UIControlStateSelected];

    VC1.tabBarItem.image=[UIImage imageNamed:@"sy"];
    VC2.tabBarItem.image=[UIImage imageNamed:@"fls"];
    VC3.tabBarItem.image=[UIImage imageNamed:@"sm"];
    VC4.tabBarItem.image=[UIImage imageNamed:@"yl"];
    VC5.tabBarItem.image=[UIImage imageNamed:@"me"];
    
    VC1.tabBarItem.selectedImage=[[UIImage imageNamed:@"select_sy"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC2.tabBarItem.selectedImage=[[UIImage imageNamed:@"select_fls"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC3.tabBarItem.selectedImage=[[UIImage imageNamed:@"select_sm"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC4.tabBarItem.selectedImage=[[UIImage imageNamed:@"select_yl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC5.tabBarItem.selectedImage=[[UIImage imageNamed:@"select_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    CustomNav *NV1=[[CustomNav alloc]initWithRootViewController:VC1];
    CustomNav *NV2=[[CustomNav alloc]initWithRootViewController:VC2];
    CustomNav *NV3=[[CustomNav alloc]initWithRootViewController:VC3];
    CustomNav *NV4=[[CustomNav alloc]initWithRootViewController:VC4];
    CustomNav *NV5=[[CustomNav alloc]initWithRootViewController:VC5];
    
    NSArray *controllersArray = @[NV1, NV2, NV3, NV4, NV5];
    
    UITabBarController *SysTab=[[UITabBarController alloc]init];
    SysTab.tabBar.barTintColor=[UIColor whiteColor];
    SysTab.viewControllers =controllersArray;
    SysTab.modalPresentationStyle = UIModalPresentationOverFullScreen;
    self.window.rootViewController=SysTab;
    
}


@end
