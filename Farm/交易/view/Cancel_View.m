//
//  Cancel_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "Cancel_View.h"

@implementation Cancel_View
-(void)creatView{
    _canBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#F2861A"].CGColor;
    _canBtn.layer.borderWidth=1;
}
-(void)returnText:(CancelBlock)block{
    self.CancelBlock=block;
}
- (IBAction)sureClick:(UIButton *)sender {
    
    [self removeFromSuperview];
    self.CancelBlock(@"1");
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
