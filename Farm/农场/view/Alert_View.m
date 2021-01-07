//
//  Alert_View.m
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import "Alert_View.h"

@implementation Alert_View


-(void)setIsBoor:(BOOL)isBoor{
    _isBoor=isBoor;
    if (_isBoor) {
        _alertLab.text=@"您的高效磷肥不够，请先购买";
        [_sureBtn setTitle:@"去购买" forState:0];
    }else{
        _alertLab.text=@"您的种子不够，请先购买";
        [_sureBtn setTitle:@"去购买" forState:0];
    }
}
-(void)returnText:(AlertBlock)block{
    self.AlertBlock=block;
}
- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
    if (_isBoor) {
        self.AlertBlock(@"0");
    }else{
        self.AlertBlock(@"1");
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
