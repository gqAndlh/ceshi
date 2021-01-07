//
//  Set_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "Set_Con.h"
#import "UserInfo_Con.h"
#import "AccSafe_Con.h"
#import "About_Con.h"

@interface Set_Con ()

@end

@implementation Set_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"用户设置";
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)menuClick:(UIButton *)sender {
    if (sender.tag==0) {
        UserInfo_Con *user=[[UserInfo_Con alloc]init];
        [self.navigationController pushViewController:user animated:YES];
    }else if (sender.tag==1){
        AccSafe_Con *safe=[[AccSafe_Con alloc]init];
        [self.navigationController pushViewController:safe animated:YES];
    }else if (sender.tag==2){
        About_Con *about=[[About_Con alloc]init];
        [self.navigationController pushViewController:about animated:YES];
    }
}
- (IBAction)outLoginClick:(UIButton *)sender {
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
