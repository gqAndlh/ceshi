//
//  MyCapital_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "MyCapital_Con.h"
#import "BalanceAgold_Con.h"
#import "MyDrawAcc_Con.h"
#import "DrawRecord_Con.h"
#import "ApplyDraw_Con.h"
#import "ChargeMoney_Con.h"
#import "ResetPayPass_Con.h"

@interface MyCapital_Con ()
@property (weak, nonatomic) IBOutlet UILabel *KyZJ;
@property (weak, nonatomic) IBOutlet UILabel *DJZJ;
@property (weak, nonatomic) IBOutlet UILabel *KTXJE;
@property (weak, nonatomic) IBOutlet UILabel *KYYE;
@property (weak, nonatomic) IBOutlet UIButton *drawBtn;
@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrView;

@end

@implementation MyCapital_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的资金";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_W"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    backItem.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = backItem;
    _drawBtn.layer.borderWidth=1;
    _drawBtn.layer.borderColor=[UIColor redColor].CGColor;
    _drawBtn.layer.cornerRadius=15;
    _rechargeBtn.layer.cornerRadius=15;
    if (@available(iOS 11, *)) {
          self.backScrView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
     } else {
          self.automaticallyAdjustsScrollViewInsets = NO;
     }
    // Do any additional setup after loading the view from its nib.
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
//资金流水
- (IBAction)MyCapitalClick:(UIButton *)sender {
    BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
    Bg.title=@"资金流水";
    Bg.type=0;
    Bg.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:Bg animated:YES];
}
//提现账户
- (IBAction)drawAcc:(UIButton *)sender {
    if ([USER_DEFAULT objectForKey:PAYPASS] != nil) {
        MyDrawAcc_Con *draw=[[MyDrawAcc_Con alloc]init];
        [self.navigationController pushViewController:draw animated:YES];
    }else{
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"您未设置支付密码"
                                                                      message:nil
                                                               preferredStyle:UIAlertControllerStyleAlert];
       
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
            ResetPayPass_Con *pass=[[ResetPayPass_Con alloc]init];
            [self.navigationController pushViewController:pass animated:YES];
                                                             }];
        [defaultAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
       UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                             }];
        [alert addAction:cancelAction];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
  
}
//提现记录
- (IBAction)drawDetail:(UIButton *)sender {
    DrawRecord_Con *draw=[[DrawRecord_Con alloc]init];
    [self.navigationController pushViewController:draw animated:YES];
}
//提现
- (IBAction)dreawClick:(UIButton *)sender {
    ApplyDraw_Con *apply=[[ApplyDraw_Con alloc]init];
    [self.navigationController pushViewController:apply animated:YES];
}
//充值
- (IBAction)rechargeClick:(UIButton *)sender {
    ChargeMoney_Con *ChargeMoney=[[ChargeMoney_Con alloc]init];
    [self.navigationController pushViewController:ChargeMoney animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewWillDisappear:(BOOL)animated{
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:[PubLic_Class imageWithColor:MAINCOLOR] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[PubLic_Class imageWithColor:MAINCOLOR]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor blackColor]}];
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
