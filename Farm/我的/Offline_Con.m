//
//  Offline_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "Offline_Con.h"
#import "BalanceAgold_Con.h"

@interface Offline_Con ()
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UITextField *ID;
@property (weak, nonatomic) IBOutlet UIButton *inspectBtn;

@end

@implementation Offline_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"线下交易";
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatView{
    _inspectBtn.layer.borderWidth=1;
    _inspectBtn.layer.borderColor=[UIColor redColor].CGColor;
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"金币明细" style:UIBarButtonItemStylePlain target:self action:@selector(goldClick)];
    right.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=right;
}
-(void)goldClick{
    BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
    Bg.title=@"金币";
    Bg.type=1;
    [self.navigationController pushViewController:Bg animated:YES];
    
}
- (IBAction)inspectClick:(UIButton *)sender {
    if (_ID.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请输入对方ID" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }
//    [PubLic_Class addMBProgressViewTitle:@"1000金币不可用" inView:self.view alpha:0.8 hideDelayTime:2];
}

- (IBAction)sureClick:(UIButton *)sender {
    if ([_num.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入交易数量" inView:self.view alpha:0.8 hideDelayTime:2];
        return;
    }else if (_ID.text.length==0){
        [PubLic_Class addMBProgressViewTitle:@"请输入对方ID" inView:self.view alpha:0.8 hideDelayTime:2];
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
