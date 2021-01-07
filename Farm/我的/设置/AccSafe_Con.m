//
//  AccSafe_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "AccSafe_Con.h"
#import "BindPhone_Con.h"
#import "ChangePass_Con.h"
#import "ResetPayPass_Con.h"
#import "ForgetPayPass_Con.h"

@interface AccSafe_Con ()
@property (weak, nonatomic) IBOutlet UILabel *PayLab;
@property (weak, nonatomic) IBOutlet UILabel *BindLab;

@end

@implementation AccSafe_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"账户安全";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)menuClick:(UIButton *)sender {
    if (sender.tag==0) {
        ChangePass_Con *pass=[[ChangePass_Con alloc]init];
        pass.title=@"修改登录密码";
        pass.PassType=0;
        [self.navigationController pushViewController:pass animated:YES];
    }else if (sender.tag==1){
        if ([_PayLab.text isEqualToString:@"设置支付密码"]) {
            ResetPayPass_Con *pass=[[ResetPayPass_Con alloc]init];
            [self.navigationController pushViewController:pass animated:YES];
        }else{
            ChangePass_Con *pass=[[ChangePass_Con alloc]init];
            pass.title=@"修改支付密码";
            pass.PassType=1;
            [self.navigationController pushViewController:pass animated:YES];
        }
        
    }
    else if (sender.tag==2){
        if ([_BindLab.text isEqualToString:@"绑定手机号码"]) {
            BindPhone_Con *bind=[[BindPhone_Con alloc]init];
            [self.navigationController pushViewController:bind animated:YES];
        }else{
            ForgetPayPass_Con *phone=[[ForgetPayPass_Con alloc]init];
            phone.type=1;
            [self.navigationController pushViewController:phone animated:YES];
        }
        
    }
}

-(void)viewWillAppear:(BOOL)animated{
    if ([USER_DEFAULT objectForKey:PAYPASS] != nil) {
        _PayLab.text=@"修改支付密码";
    }else{
        _PayLab.text=@"设置支付密码";
    }
    DLog(@"%@",[USER_DEFAULT objectForKey:BINDPHONE])
    if ([USER_DEFAULT objectForKey:BINDPHONE]!=nil) {
        _BindLab.text=@"修改手机号码";
    }else{
        _BindLab.text=@"绑定手机号码";
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
