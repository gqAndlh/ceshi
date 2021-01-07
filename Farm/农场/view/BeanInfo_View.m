//
//  BeanInfo_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "BeanInfo_View.h"
#import "BeanCgold_View.h"

@implementation BeanInfo_View
-(void)returnText:(BeanBlock)block{
    self.BeanBlock=block;
}
-(void)setDic:(NSDictionary *)dic{
    _KyNum.text=@"0.00";
    _DjNum.text=@"0.00";
}
- (IBAction)changeClick:(UIButton *)sender {
    BeanCgold_View *BeanCgold=[[[NSBundle mainBundle]loadNibNamed:@"BeanCgold_View" owner:nil options:nil]lastObject];
    BeanCgold.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [BeanCgold creatView];
    BeanCgold.BeanBlock = ^(NSString *showText) {
        self.BeanBlock(@"1");
    };
    [[UIApplication sharedApplication].keyWindow addSubview:BeanCgold];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
