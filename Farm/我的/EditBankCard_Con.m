//
//  EditBankCard_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "EditBankCard_Con.h"
#import "QuestionType_View.h"
#import "JYAddressPicker.h"

@interface EditBankCard_Con ()
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *cardNum;
@property (nonatomic, strong) NSArray *selectedArr;

@end

@implementation EditBankCard_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_dic!=nil) {
        _bankName.text=@"工商银行";
        _address.text=@"山西省太原市小店区平阳路";
        _name.text=@"蒋瑞鹏";
        _cardNum.text=@"12321321321321321321321";
    }
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeClick:(UIButton *)sender {
    [_name resignFirstResponder];
    [_cardNum resignFirstResponder];
    QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
    question.frame=[UIApplication sharedApplication].keyWindow.bounds;
    question.type=2;
    [question creatView];
    question.QuestionBlock = ^(NSString * _Nonnull showText) {
        _bankName.text=showText;
    };
    [[UIApplication sharedApplication].keyWindow addSubview:question];
}
- (IBAction)addressClick:(UIButton *)sender {
    [_name resignFirstResponder];
    [_cardNum resignFirstResponder];
    if (self.selectedArr) {
        NSArray *defaultValues = @[[self.selectedArr objectAtIndex:0][@"text"],[self.selectedArr objectAtIndex:1][@"text"],[self.selectedArr objectAtIndex:2][@"text"]];
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self defaultShow:defaultValues];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            _address.text=[NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
    }else{
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            _address.text=[NSString stringWithFormat:@"%@%@%@",province,city,county];
            self.selectedArr = addressArr;
        };
        
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
