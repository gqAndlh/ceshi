//
//  ChargeMoney_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "ChargeMoney_Con.h"

@interface ChargeMoney_Con ()
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UIButton *WX;
@property (weak, nonatomic) IBOutlet UIButton *ZFB;

@end

@implementation ChargeMoney_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"充值";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeclick:(UIButton *)sender {
    if (sender.tag==0) {
        _WX.selected=YES;
        _ZFB.selected=NO;
    }else{
        _WX.selected=NO;
        _ZFB.selected=YES;
    }
}

- (IBAction)drawClick:(UIButton *)sender {
    if ([_money.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入金额" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
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
