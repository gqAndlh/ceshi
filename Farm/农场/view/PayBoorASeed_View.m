//
//  PayBoorASeed_View.m
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import "PayBoorASeed_View.h"

@implementation PayBoorASeed_View


-(void)creatView{
    _typeBack.layer.cornerRadius=16;
    _typeBack.layer.masksToBounds=YES;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_subBtn.bounds   byRoundingCorners:UIRectCornerBottomLeft |   UIRectCornerTopLeft    cornerRadii:CGSizeMake(14, 14)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _subBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    _subBtn.layer.mask = maskLayer;
    
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:_addBtn.bounds   byRoundingCorners:UIRectCornerTopRight |   UIRectCornerBottomRight cornerRadii:CGSizeMake(14, 14)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = _addBtn.bounds;
    maskLayer1.path = maskPath1.CGPath;
    _addBtn.layer.mask = maskLayer1;
}
-(void)setIsBoor:(BOOL)isBoor{
    _isBoor=isBoor;
    if (_isBoor) {
        _typeBack.center=_boorBtn.center;
        _typeBack.text=@"买高效磷肥";
        _KcNum.text=[NSString stringWithFormat:@"磷肥库存：%@袋",@"0"];
        NSString *str=[NSString stringWithFormat:@"%@云豆",@"100"];
        NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
        NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
        [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-2, 2)];
        _num.attributedText=rmbStr;
    }else{
        _typeBack.center=_seedBtn.center;
        _typeBack.text=@"买种子";
        _KcNum.text=[NSString stringWithFormat:@"种子库存：%@粒",@"0"];
        NSString *str=[NSString stringWithFormat:@"%@￥",@"100"];
        NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
        NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
        [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-1, 1)];
        _num.attributedText=rmbStr;
    }
    
}
- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)changeClick:(UIButton *)sender {
    if (sender.tag==0) {
        if ([_numlab.text intValue] > 1) {
            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]-1];
        }
    }else{
        if ([_numlab.text intValue] < 100) {
            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]+1];
        }
    }
}
-(void)returnText:(PayBlock)block{
    self.PayBlock=block;
}

- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)chooseClick:(UIButton *)sender {
    if (sender.tag==0) {
        [UIView animateWithDuration:0.2 animations:^{
            _typeBack.center=_seedBtn.center;
            _typeBack.text=@"买种子";
            _KcNum.text=[NSString stringWithFormat:@"种子库存：%@粒",@"0"];
            NSString *str=[NSString stringWithFormat:@"%@￥",@"100"];
            NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
            NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
            [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-1, 1)];
            _num.attributedText=rmbStr;
        }];
        
    }else{
        [UIView animateWithDuration:0.2 animations:^{
            _typeBack.center=_boorBtn.center;
            _typeBack.text=@"买高效磷肥";
            _KcNum.text=[NSString stringWithFormat:@"磷肥库存：%@袋",@"0"];
            NSString *str=[NSString stringWithFormat:@"%@云豆",@"100"];
            NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
            NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
            [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-2, 2)];
            _num.attributedText=rmbStr;
        }];
        
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
