//
//  Trans_Cell.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "Trans_Cell.h"

@implementation Trans_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    _payBtn.layer.borderWidth=1;
    _payBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#F2861A"].CGColor;
    // Initialization code
}
-(void)setDic:(NSDictionary *)dic{
    _allNum.text=@"";
    _num.text=@"";
    _time.text=@"";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
