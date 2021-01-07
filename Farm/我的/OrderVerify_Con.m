//
//  OrderVerify_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "OrderVerify_Con.h"

@interface OrderVerify_Con ()
@property (weak, nonatomic) IBOutlet UITextField *searchText;

@end

@implementation OrderVerify_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"订单验证核销";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)queryClick:(UIButton *)sender {
    
    [_searchText resignFirstResponder];
    if (_searchText.text.length==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入正确的核验码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
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
