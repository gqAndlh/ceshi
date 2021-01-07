//
//  Me_Con.m
//  Farm
//
//  Created by mac on 2020/12/15.
//

#import "Me_Con.h"
#import "BalanceAgold_Con.h"
#import "Set_Con.h"
#import "SellOrder_Con.h"
#import "MyOrder_Con.h"
#import "OrderVerify_Con.h"
#import "Team_Con.h"
#import "Offline_Con.h"
#import "AttentionGood_Con.h"
#import "AttentionShop_Con.h"
#import "Browse_Con.h"
#import "Vip_Con.h"
#import "MyAddress_Con.h"
#import "MyInvoice_Con.h"
#import "Feedback_Con.h"
#import "Report_Con.h"
#import "Complain_Con.h"
#import "Aftersale_Con.h"
#import "MyCapital_Con.h"
#import "BindPhone_Con.h"
#import "Mess_Con.h"

@interface Me_Con ()
@property (weak, nonatomic) IBOutlet UIScrollView *backScrView;
@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIButton *signLab;

@end

@implementation Me_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    _backScrView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_downView.frame));
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)setClick:(UIButton *)sender {
    DLog(@"设置");
    Set_Con *set=[[Set_Con alloc]init];
    set.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:set animated:YES];
}
- (IBAction)mess:(UIButton *)sender {
    DLog(@"消息");
    Mess_Con *mess=[[Mess_Con alloc]init];
    mess.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:mess animated:YES];
}

#pragma mark -签到
- (IBAction)signClick:(UIButton *)sender {
    DLog(@"签到");
    [PubLic_Class addMBProgressViewTitle:@"签到成功" inView:self.view alpha:0.8 hideDelayTime:2];
    [_signLab setTitle:@"已签到" forState:0];
}
#pragma mark - 绑定
- (IBAction)bindPhoneClick:(UIButton *)sender {
    DLog(@"绑定手机号");
    BindPhone_Con *bind=[[BindPhone_Con alloc]init];
    bind.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:bind animated:YES];
}
#pragma mark - 会员
- (IBAction)VipClick:(UIButton *)sender {
    DLog(@"会员");
    Vip_Con *vip=[[Vip_Con alloc]init];
    vip.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vip animated:YES];
}
#pragma mark - 自提
- (IBAction)TakeTheirClick:(UIButton *)sender {
    DLog(@"自提");
    OrderVerify_Con *order=[[OrderVerify_Con alloc]init];
    order.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:order animated:YES];
}
#pragma mark - 商家订单
- (IBAction)sellerManagerClick:(UIButton *)sender {
    DLog(@"商家订单");
    SellOrder_Con *sell=[[SellOrder_Con alloc]init];
    sell.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:sell animated:YES];
}
#pragma Mark- 我的订单
- (IBAction)myOrderMenager:(UIButton *)sender {
    DLog(@"我的订单");
    MyOrder_Con *my=[[MyOrder_Con alloc]init];
    my.hidesBottomBarWhenPushed=YES;
    my.type=0;
    [self.navigationController pushViewController:my animated:YES];
}
#pragma mark - 我的资产管理
- (IBAction)PriceMenager:(UIButton *)sender {
    DLog(@"我的资产管理");
    MyCapital_Con *MyCapital=[[MyCapital_Con alloc]init];
    MyCapital.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:MyCapital animated:YES];
}



#pragma mark - 我的订单
- (IBAction)orderCklick:(UIButton *)sender {
    MyOrder_Con *my=[[MyOrder_Con alloc]init];
    my.hidesBottomBarWhenPushed=YES;
    if (sender.tag==0) {
        DLog(@"待付款");
        my.type=1;
    }else if (sender.tag==1){
        DLog(@"待发货");
        my.type=2;
    }else if (sender.tag==2){
        DLog(@"待收货");
        my.type=3;
    }else if (sender.tag==3){
        DLog(@"待评价");
        my.type=4;
    }else if (sender.tag==4){
        DLog(@"取消");
        my.type=6;
    }
    [self.navigationController pushViewController:my animated:YES];
}
#pragma mark - 我的财产
- (IBAction)myZcClick:(UIButton *)sender {
    if (sender.tag==0) {
        DLog(@"余额");
        MyCapital_Con *MyCapital=[[MyCapital_Con alloc]init];
        MyCapital.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:MyCapital animated:YES];
    }else if (sender.tag==1){
        DLog(@"积分");
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"积分";
        Bg.type=3;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }else if (sender.tag==2){
        DLog(@"云豆");
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"云豆";
        Bg.type=2;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }else if (sender.tag==3){
        DLog(@"金币");
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"金币";
        Bg.type=1;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }
}
#pragma mark - 助手工具
- (IBAction)menuClick:(UIButton *)sender {
    if (sender.tag==0) {
        DLog(@"推广");
    }else if (sender.tag==1){
        DLog(@"团队");
        Team_Con *team=[[Team_Con alloc]init];
        team.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:team animated:YES];
    }else if (sender.tag==2){
        DLog(@"交易");
        Offline_Con *line=[[Offline_Con alloc]init];
        line.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:line animated:YES];
    }else if (sender.tag==3){
        DLog(@"关注商品");
        AttentionGood_Con *good=[[AttentionGood_Con alloc]init];
        good.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:good animated:YES];
    }else if (sender.tag==4){
        DLog(@"关注店铺");
        AttentionShop_Con *shop=[[AttentionShop_Con alloc]init];
        shop.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:shop animated:YES];
    }else if (sender.tag==5){
        DLog(@"浏览记录");
        Browse_Con *Browse=[[Browse_Con alloc]init];
        Browse.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Browse animated:YES];
    }else if (sender.tag==6){
        DLog(@"资金管理");
        MyCapital_Con *MyCapital=[[MyCapital_Con alloc]init];
        MyCapital.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:MyCapital animated:YES];
    }else if (sender.tag==7){
        DLog(@"积分");
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"积分";
        Bg.type=3;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }else if (sender.tag==8){
        DLog(@"地址");
        MyAddress_Con *add=[[MyAddress_Con alloc]init];
        add.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:add animated:YES];
    }else if (sender.tag==9){
        DLog(@"投诉");
        Complain_Con *complain=[[Complain_Con alloc]init];
        complain.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:complain animated:YES];
    }else if (sender.tag==10){
        DLog(@"反馈");
        Feedback_Con *feed=[[Feedback_Con alloc]init];
        feed.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:feed animated:YES];
    }else if (sender.tag==11){
        DLog(@"售后");
        Aftersale_Con *after=[[Aftersale_Con alloc]init];
        after.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:after animated:YES];
    }else if (sender.tag==12){
        DLog(@"发票");
        MyInvoice_Con *Invoice=[[MyInvoice_Con alloc]init];
        Invoice.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Invoice animated:YES];
    }else if (sender.tag==13){
        DLog(@"举报");
        Report_Con *Report=[[Report_Con alloc]init];
        Report.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Report animated:YES];
    }
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
