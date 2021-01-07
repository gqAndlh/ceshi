//
//  ResetPayPass_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "ResetPayPass_Con.h"

@interface ResetPayPass_Con ()
@property (weak, nonatomic) IBOutlet UITextField *PassNew;
@property (weak, nonatomic) IBOutlet UITextField *surePass;
@end

@implementation ResetPayPass_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置支付密码";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)sureClick:(UIButton *)sender {
   if (![_PassNew.text judgePassWordLegal]){
        [PubLic_Class addMBProgressViewTitle:PASSAlert inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (![_PassNew.text isEqualToString:_surePass.text]){
        [PubLic_Class addMBProgressViewTitle:@"密码不一致" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [USER_DEFAULT setObject:_PassNew.text forKey:PAYPASS];
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
