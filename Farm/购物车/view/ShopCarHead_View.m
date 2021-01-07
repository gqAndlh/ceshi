//
//  ShopCarHead_View.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "ShopCarHead_View.h"

@implementation ShopCarHead_View

- (IBAction)goShopClick:(UIButton *)sender {
    self.shopBlock(@"0");
}
- (IBAction)attentionClick:(UIButton *)sender {
    self.shopBlock(@"1");
}

-(void)returnText:(shopBlock)block{
    self.shopBlock=block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
