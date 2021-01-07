//
//  ShopCar_Cell.m
//  Farm
//
//  Created by mac on 2020/12/16.
//

#import "ShopCar_Cell.h"

@implementation ShopCar_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setDic:(NSDictionary *)dic{
    _dic=dic;
    _price.text=[NSString stringWithFormat:@"￥%@",dic[@"price"]];
    _num.text=[NSString stringWithFormat:@"%@",_dic[@"num"]];
    if ([dic[@"state"] intValue]==0) {
        _chooseBtn.selected=NO;
    }else{
        _chooseBtn.selected=YES;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
