//
//  Vip_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "Vip_Con.h"
#import "PayVip_View.h"

@interface Vip_Con ()
@property (weak, nonatomic) IBOutlet UIImageView *line;
@property (weak, nonatomic) IBOutlet UILabel *oneText;
@property (weak, nonatomic) IBOutlet UILabel *twoText;
@property (weak, nonatomic) IBOutlet UILabel *threeText;

@end

@implementation Vip_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"会员权益";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)vipClick:(UIButton *)sender {
    CGRect LF = _line.frame;
    LF.origin.x = sender.center.x-10;
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
    if (sender.tag>0) {
        _threeText.hidden=YES;
    }else{
        _threeText.hidden=NO;
    }
    
    if (sender.tag==0) {
        _oneText.text=@"会员权益：会员费用 0.01 元，赠送两瓶高档红酒或纳米量子水两袋, 享受平台3-7折的消费服务！每分享一个会员奖励 280 元，会员期限为一年 ； 第二年会员续费推荐人仍有奖励 。";
        _twoText.text=@"直推关系终身消费产生的利润 30% 作为您的消费分红 。";
    }else if (sender.tag==1){
        _oneText.text=@"铜牌会员权益：直推 2 名会员自动晋升为铜牌会员、铜牌会员享受 40 元的二代奖励 、直推奖励不变 。";
        _twoText.text=@"团队消费利润的20%作为您的消费分红。";
    }else if (sender.tag==2){
        _oneText.text=@"银牌会员权益：直推 5 名会员自动晋升为银牌会员、银牌会员享受 50 元的二代奖励 、直推奖励不变 。";
        _twoText.text=@"团队消费利润的25%作为您的消费分红。";
    }else if (sender.tag==3){
        _oneText.text=@"金牌会员权益：直推 10 名会员自动晋升为金牌会员、金牌会员享受 60 元的二代奖励 、直推奖励不变 。";
        _twoText.text=@"团队消费利润的30%作为您的消费分红。";
    }else if (sender.tag==4){
        _oneText.text=@"铂金会员权益：直推 15 名会员自动晋升为铂金会员、铂金会员享受 70 元的二代奖励 、直推奖励不变 。";
        _twoText.text=@"团队消费利润的35%作为您的消费分红。";
    }
}
- (IBAction)payVip:(id)sender {
    PayVip_View *pay=[[[NSBundle mainBundle]loadNibNamed:@"PayVip_View" owner:nil options:nil]lastObject];
    pay.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:pay];
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
