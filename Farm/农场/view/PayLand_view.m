//
//  PayLand_view.m
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import "PayLand_view.h"

@implementation PayLand_view

-(void)creatView{
    NSString *str=[NSString stringWithFormat:@"%@金币",@"10"];
    NSMutableAttributedString *rmbStr=[[NSMutableAttributedString alloc] initWithString:str attributes:nil];
    NSDictionary *fontDic=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:20],NSFontAttributeName, nil];
    [rmbStr addAttributes:fontDic range:NSMakeRange(str.length-2, 2)];
    _num.attributedText=rmbStr;
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
-(void)returnText:(PayLandBlock)block{
    self.PayLandBlock=block;
}

- (IBAction)sureClick:(UIButton *)sender {
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
