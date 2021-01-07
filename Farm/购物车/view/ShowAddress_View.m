//
//  ShowAddress_View.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "ShowAddress_View.h"

@implementation ShowAddress_View


-(void)returnText:(addBlock)block{
    self.addBlock=block;
}
- (IBAction)addClick:(UIButton *)sender {
    self.addBlock(@"1");
}
-(void)creatView{
    _name.text=@"星哥 12312312312";
    _address.text=@"山西省太原市小店区平阳景苑";
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
