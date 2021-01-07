//
//  EditAddress_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "EditAddress_Con.h"
#import "JYAddressPicker.h"

@interface EditAddress_Con ()
@property (weak, nonatomic) IBOutlet UIButton *addRessBtn;
@property (nonatomic, strong) NSArray *selectedArr;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *detailAddress;



@end

@implementation EditAddress_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_dic!=nil) {
        _name.text=@"高强";
        _phone.text=@"13552563863";
        [_addRessBtn setTitle:@"山西省吕梁市兴县" forState:0];
        _detailAddress.text=@"蔡家会";
    }
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)saveClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//选择地址
- (IBAction)addRessClick:(UIButton *)sender {
    if (self.selectedArr) {
        
        NSArray *defaultValues = @[[self.selectedArr objectAtIndex:0][@"text"],[self.selectedArr objectAtIndex:1][@"text"],[self.selectedArr objectAtIndex:2][@"text"]];
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self defaultShow:defaultValues];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            [_addRessBtn setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,county] forState:0];
            self.selectedArr = addressArr;
        };
    }else{
        JYAddressPicker *addressPicker = [JYAddressPicker jy_showAt:self];
        addressPicker.selectedItemBlock = ^(NSArray *addressArr) {
            
            NSString *province = [addressArr objectAtIndex:0][@"text"];
            NSString *city = [addressArr objectAtIndex:1][@"text"];
            NSString *county = [addressArr objectAtIndex:2][@"text"];
            
            [_addRessBtn setTitle:[NSString stringWithFormat:@"%@%@%@",province,city,county] forState:0];
            self.selectedArr = addressArr;
        };
        
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
