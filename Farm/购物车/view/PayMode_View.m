//
//  PayMode_View.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "PayMode_View.h"

@implementation PayMode_View


-(void)returnText:(PayBlock)block{
    self.PayBlock=block;
}
- (IBAction)chooseClick:(UIButton *)sender {
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
