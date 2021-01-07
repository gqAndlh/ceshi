//
//  Payripe_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "Payripe_View.h"

@implementation Payripe_View

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
-(void)returnText:(PayBlock)block{
    self.PayBlock=block;
}
- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)sureClick:(UIButton *)sender {
    if ([_num.text intValue]==0) {
        [PubLic_Class addMBProgressViewTitle:@"请输入数量" inView:self alpha:0.8 hideDelayTime:2];
        return;
    }else if ([_num.text intValue]>[_KcNum.text intValue]){
        [PubLic_Class addMBProgressViewTitle:@"库存不足" inView:self alpha:0.8 hideDelayTime:2];
        return;
    }
    [self removeFromSuperview];
    self.PayBlock(@"1");
}
@end
