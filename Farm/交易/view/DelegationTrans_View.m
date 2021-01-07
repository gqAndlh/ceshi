//
//  DelegationTrans_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "DelegationTrans_View.h"

@implementation DelegationTrans_View

-(void)creatView{
    [_num becomeFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
-(void)returnText:(delegateBlock)block{
    self.delegateBlock=block;
}
- (IBAction)sureClick:(UIButton *)sender {
    if ([_num.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入数量" inView:self alpha:0.8 hideDelayTime:2];
        return;
    }else if ([_num.text intValue]>500){
        [PubLic_Class addMBProgressViewTitle:@"最多出售500粒" inView:self alpha:0.8 hideDelayTime:2];
        return;
    }
    [self removeFromSuperview];
    self.delegateBlock(@"1");
}


@end
