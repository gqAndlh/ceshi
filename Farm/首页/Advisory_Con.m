//
//  Advisory_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "Advisory_Con.h"
#import "AddAdvisory_Con.h"

@interface Advisory_Con ()
@property (weak, nonatomic) IBOutlet UIView *alertView;

@end

@implementation Advisory_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商品咨询";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)advisoryClick:(UIButton *)sender {
    AddAdvisory_Con *Add=[[AddAdvisory_Con alloc]init];
    [self.navigationController pushViewController:Add animated:YES];
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
