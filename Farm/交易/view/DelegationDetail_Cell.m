//
//  DelegationDetail_Cell.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "DelegationDetail_Cell.h"

@implementation DelegationDetail_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    _cancleBtn.layer.borderWidth=1;
    _cancleBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#A1A1A1"].CGColor;
    // Initialization code
}
-(void)setDic:(NSDictionary *)dic{
    if (_type==0) {
        _cancleBtn.hidden=NO;
        _finishLab.hidden=YES;
        _cancleLab.hidden=YES;
    }else if (_type==1){
        _cancleBtn.hidden=YES;
        _finishLab.hidden=NO;
        _cancleLab.hidden=YES;
    }else if (_type==2){
        _cancleBtn.hidden=YES;
        _finishLab.hidden=YES;
        _cancleLab.hidden=NO;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
