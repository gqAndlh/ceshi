//
//  MyOrder_Cell.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "MyOrder_Cell.h"

@implementation MyOrder_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setDic:(NSDictionary *)dic{
    if (_ISsell) {
        _stateLab.text=[self sellstate:_state];
    }else
        _stateLab.text=[self state:_state];
    
    if (_state==6) {
        _cancelBtn.hidden=YES;
        _stateBtn.hidden=YES;
        CGRect CF = self.frame;
        CF.size.height = 157;
        self.frame=CF;
    }
}
-(NSString *)state:(NSInteger)state{
    if (state==1) {
        return @"待付款";
    }else if (state==2){
        return @"待发货";
    }else if (state==3){
        return @"待收货";
    }else if (state==4){
        return @"待评价";
    }else if (state==5){
        return @"交易完成";
    }else if (state==6){
        return @"拒收";
    }
    return @"";
}
-(NSString *)sellstate:(NSInteger)state{
    if (state==1) {
        return @"待付款";
    }else if (state==2){
        return @"待发货";
    }else if (state==3){
        return @"待收货";
    }else if (state==4){
        return @"交易完成";
    }else if (state==5){
        return @"拒收";
    }
    return @"";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
