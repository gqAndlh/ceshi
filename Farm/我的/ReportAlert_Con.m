//
//  ReportAlert_Con.m
//  Farm
//
//  Created by mac on 2020/12/30.
//

#import "ReportAlert_Con.h"

@interface ReportAlert_Con ()
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation ReportAlert_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"举报须知";
    [_content sizeToFit];
    // Do any additional setup after loading the view from its nib.
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
