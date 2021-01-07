//
//  AddaPay_View.m
//  Farm
//
//  Created by mac on 2020/12/28.
//

#import "AddaPay_View.h"

@implementation AddaPay_View


- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)changeClick:(UIButton *)sender {
    if (sender.tag==0) {
        if ([_numlab.text intValue] > 1) {
            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]-1];
        }
    }else{
        if ([_numlab.text intValue] < 100) {
            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]+1];
        }
    }
}
-(void)returnText:(PayBlock)block{
    self.PayBlock=block;
}

- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
    self.PayBlock(@"1");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
