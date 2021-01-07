//
//  EditName_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "EditName_Con.h"

@interface EditName_Con ()
@property (weak, nonatomic) IBOutlet UITextField *name;

@end

@implementation EditName_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"修改昵称";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)saveClick:(UIButton *)sender {
    if (_name.text.length==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入昵称" inView:self.view alpha:0.8 hideDelayTime:2];
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
