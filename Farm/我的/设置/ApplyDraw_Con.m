//
//  ApplyDraw_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "ApplyDraw_Con.h"
#import "BanKAccList_Con.h"

@interface ApplyDraw_Con ()
@property (weak, nonatomic) IBOutlet UILabel *acc;
@property (weak, nonatomic) IBOutlet UITextField *money;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UIScrollView *backscrView;

@end

@implementation ApplyDraw_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"申请提现";
    _backscrView.contentSize=CGSizeMake(SCREEN_WIDTH, 500);
    // Do any additional setup after loading the view from its nib.
}
//提现账号
- (IBAction)AccClick:(UIButton *)sender {
    BanKAccList_Con *list=[[BanKAccList_Con alloc]init];
    list.con=self;
    [self.navigationController pushViewController:list animated:YES];
}
- (IBAction)allMoneyClick:(UIButton *)sender {
    _money.text=@"100.00";
}
- (IBAction)sureClick:(UIButton *)sender {
    if ([_money.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入金额" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if(_pass.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请输入支付密码" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    _acc.text=_AccStr;
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
