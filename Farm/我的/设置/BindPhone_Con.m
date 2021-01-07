//
//  BindPhone_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "BindPhone_Con.h"
#import "CaptchaView.h"

@interface BindPhone_Con ()
{
    int a;
}
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *imgCode;
@property (weak, nonatomic) IBOutlet UIImageView *codeImg;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (nonatomic)CaptchaView *cap;//图形验证码

@end

@implementation BindPhone_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    a=30;
    self.title=@"绑定手机号";
    _cap=[[CaptchaView alloc]initWithFrame:_codeImg.frame];
    [self.view addSubview:_cap];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - 获取验证码
- (IBAction)requestCode:(UIButton *)sender {
    if (_phone.text.length!=11) {
        [PubLic_Class addMBProgressViewTitle:@"请输入正确的手机号" inView:self.view alpha:0.8 hideDelayTime:1];
        return;
    }
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(codeGetTimer:) userInfo:nil repeats:YES];
}
- (IBAction)sureClick:(UIButton *)sender {
    if (_phone.text.length!=11) {
        [PubLic_Class addMBProgressViewTitle:@"请输入正确的手机号" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (![_imgCode.text.uppercaseString isEqualToString:_cap.changeString.uppercaseString]){
        [PubLic_Class addMBProgressViewTitle:@"请输入正确的图形验证码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (_imgCode.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请输入验证码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [USER_DEFAULT setObject:_phone.text forKey:BINDPHONE];
    [self.navigationController popViewControllerAnimated:YES];
}
//验证码计时器
-(void)codeGetTimer:(NSTimer *)timer
{
    _codeBtn.userInteractionEnabled=NO;
    a--;
    [_codeBtn setTitle:[NSString stringWithFormat:@"%d秒后再试",a] forState:UIControlStateNormal];
    if (a==0) {
        _codeBtn.userInteractionEnabled=YES;
        [_codeBtn setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
        [timer invalidate];
        a=30;
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
