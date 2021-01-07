//
//  DelegationAlert_View.m
//  Farm
//
//  Created by mac on 2020/12/14.
//

#import "DelegationAlert_View.h"
#import "DelegationTrans_View.h"

@implementation DelegationAlert_View
-(void)creatView{
    _canBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#F2861A"].CGColor;
    _canBtn.layer.borderWidth=1;
}
-(void)returnText:(alertBlock)block{
    self.alertBlock=block;
}
- (IBAction)sureClick:(UIButton *)sender {
    
    [self removeFromSuperview];
    DelegationTrans_View *trans=[[[NSBundle mainBundle]loadNibNamed:@"DelegationTrans_View" owner:nil options:nil]lastObject];
    trans.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:trans];
    [trans creatView];
    trans.delegateBlock = ^(NSString * _Nonnull showText) {
        self.alertBlock(@"1");
    };
}

- (IBAction)canClick:(UIButton *)sender {
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
