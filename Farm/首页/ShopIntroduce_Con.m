//
//  ShopIntroduce_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "ShopIntroduce_Con.h"

@interface ShopIntroduce_Con ()
@property (weak, nonatomic) IBOutlet UIScrollView *backScrView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *num1;
@property (weak, nonatomic) IBOutlet UILabel *num2;
@property (weak, nonatomic) IBOutlet UILabel *num3;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UIImageView *codeImg;

@end

@implementation ShopIntroduce_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"店铺信息";
    _backScrView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_codeImg.frame)+20);
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - 关注
- (IBAction)attClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
    }
}
#pragma mark - 联系卖家
- (IBAction)phoneClick:(UIButton *)sender {
}
#pragma mark - 查看
- (IBAction)LookClick:(id)sender {
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:nil];

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
