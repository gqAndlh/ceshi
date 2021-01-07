//
//  ShopDetailHead_View.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "ShopDetailHead_View.h"

@implementation ShopDetailHead_View

- (IBAction)typeClick:(UIButton *)sender {
    CGRect LF = _line.frame;
    LF.origin.x=sender.center.x-15;
    [UIView animateWithDuration:0.3 animations:^{
            _line.frame=LF;
    }];
    
}

- (IBAction)collestclick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
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
