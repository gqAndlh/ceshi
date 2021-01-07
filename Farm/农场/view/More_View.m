//
//  More_View.m
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import "More_View.h"

@implementation More_View


- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}

-(void)returnText:(MoreBlock)block{
    self.MyBlock=block;
}

- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
    self.MyBlock(@"1");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
