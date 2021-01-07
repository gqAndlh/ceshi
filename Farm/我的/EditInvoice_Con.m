//
//  EditInvoice_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "EditInvoice_Con.h"

@interface EditInvoice_Con ()
@property (weak, nonatomic) IBOutlet UITextField *TT;//抬头
@property (weak, nonatomic) IBOutlet UITextField *SH;//税号
@property (weak, nonatomic) IBOutlet UITextField *address;//地址
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *bank;
@property (weak, nonatomic) IBOutlet UITextField *bankNum;
@property (weak, nonatomic) IBOutlet UIView *downView;

@property (weak, nonatomic) IBOutlet UIButton *commonBtn;
@property (weak, nonatomic) IBOutlet UIButton *dedicatedBtn;

@end

@implementation EditInvoice_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_dic!=nil) {
        _TT.text=@"山西云龙集团";
        _SH.text=@"1111111111R";
        _address.text=@"山西省吕梁市";
        _phone.text=@"13552563863";
        _bank.text=@"工商银行";
        _bankNum.text=@"123123213135433213213214";
    }
    
    _commonBtn.selected=YES;
    _dedicatedBtn.selected=NO;
    _downView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    for (UIView *v in _downView.subviews) {
        v.hidden=YES;
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeClick:(UIButton *)sender {
    if (sender.tag==0) {
        _commonBtn.selected=YES;
        _dedicatedBtn.selected=NO;
        _downView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        for (UIView *v in _downView.subviews) {
            v.hidden=YES;
        }
    }else{
        _commonBtn.selected=NO;
        _dedicatedBtn.selected=YES;
        for (UIView *v in _downView.subviews) {
            v.hidden=NO;
        }
        _downView.backgroundColor=[UIColor whiteColor];
    }
}
- (IBAction)saveClick:(UIButton *)sender {
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
