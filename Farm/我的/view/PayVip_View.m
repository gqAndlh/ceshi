//
//  PayVip_View.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "PayVip_View.h"

@implementation PayVip_View
- (IBAction)wxClick:(UIButton *)sender {
    _WxBtn.selected=YES;
    _zfbBtn.selected=NO;
}
- (IBAction)zfbClick:(id)sender {
    _WxBtn.selected=NO;
    _zfbBtn.selected=YES;
}
- (IBAction)sureClick:(id)sender {
    [self removeFromSuperview];
}
- (IBAction)cancelClcik:(UIButton *)sender {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
