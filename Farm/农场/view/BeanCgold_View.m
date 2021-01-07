//
//  BeanCgold_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "BeanCgold_View.h"

@implementation BeanCgold_View

-(void)creatView{
    [_num becomeFirstResponder];
    _canBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#F2861A"].CGColor;
    _canBtn.layer.borderWidth=1;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)returnText:(BeanBlock)block{
    self.BeanBlock=block;
}
- (IBAction)sureClick:(UIButton *)sender {
    
    if ([_num.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入兑换数量" inView:self alpha:0.8 hideDelayTime:2];
        return;
    }
    [self removeFromSuperview];
    self.BeanBlock(@"1");
}

- (IBAction)canClick:(UIButton *)sender {
    [self removeFromSuperview];
}

@end
