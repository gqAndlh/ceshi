//
//  BalanceAgold_View.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "BalanceAgold_View.h"

@implementation BalanceAgold_View

- (void)setDic:(NSDictionary *)dic{
//    NSString *str=[NSString stringWithFormat:@"%@金币",@"10000"];
//    NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
//    NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
//    [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-2, 2)];
//    _num.attributedText=rmbStr;
    
    if (_type==0) {
        _KyLab.text=@"可用资金";
        _DjLab.text=@"冻结资金";
        _KyNum.text=@"0.00";
        _DjNum.text=@"0.00";
        _typeLab.text=@"资金明细";
    }else if(_type==1){
        _KyLab.text=@"可用金币";
        _DjLab.text=@"冻结金币";
        _KyNum.text=@"0.00";
        _DjNum.text=@"0.00";
        _typeLab.text=@"金币明细";
    }else if(_type==2){
        _typeLab.text=@"云豆明细";
        _KyNum.text=@"0.00";
        _DjNum.text=@"0.00";
    }else if(_type==3){
        _typeLab.text=@"积分明细";
        _line.hidden=YES;
        _DjLab.hidden=YES;
        _DjNum.hidden=YES;
        _KyLab.text=@"我的积分";
        _KyNum.text=@"1000";
        CGRect NF = _KyNum.frame;
        CGRect LF = _KyLab.frame;
        NF.origin.x = self.center.x-(NF.size.width/2);
        LF.origin.x = self.center.x-(LF.size.width/2);
        _KyNum.frame=NF;
        _KyLab.frame=LF;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
