//
//  ChangePss.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "ChangePass_Con.h"
#import "ForgetPayPass_Con.h"

@interface ChangePass_Con ()
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *PassNew;
@property (weak, nonatomic) IBOutlet UITextField *surePass;
@property (weak, nonatomic) IBOutlet UIButton *forgetPass;

@end

@implementation ChangePass_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_PassType==0) {
        _forgetPass.hidden=YES;
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)sureClick:(UIButton *)sender {
    if (_pass.text.length==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入原密码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (_PassNew.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请输入新密码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (![_PassNew.text isEqualToString:_surePass.text]){
        [PubLic_Class addMBProgressViewTitle:@"新密码不一致" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//忘记密码
- (IBAction)forgetClick:(id)sender {
    ForgetPayPass_Con *Paypass=[[ForgetPayPass_Con alloc]init];
    Paypass.type=0;
    [self.navigationController pushViewController:Paypass animated:YES];
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
