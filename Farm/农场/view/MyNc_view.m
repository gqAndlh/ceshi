//
//  MyNc_view.m
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import "MyNc_view.h"

@implementation MyNc_view


-(void)creatView{
    _typeBack.layer.cornerRadius=16;
    _typeBack.layer.masksToBounds=YES;
    _payBtn.layer.cornerRadius=22;
    _payBtn.layer.borderWidth=1;
    _payBtn.layer.borderColor=[PubLic_Class colorWithHexString:@"#F2861A"].CGColor;
    
    if (_alertLab.hidden) {
        _payBtn.hidden=NO;
        _seed.hidden=NO;
        _sureBtn.hidden=YES;
    }else{
        _payBtn.hidden=YES;
        _seed.hidden=YES;
        _sureBtn.hidden=NO;
    }
}

- (IBAction)closeClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)changeClick:(UIButton *)sender {
    if (sender.tag==0) {
//        if ([_numlab.text intValue] > 1) {
//            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]-1];
//        }
//    }else{
//        if ([_numlab.text intValue] < 100) {
//            _numlab.text=[NSString stringWithFormat:@"%d",[_numlab.text intValue]+1];
//        }
    }
}
-(void)returnText:(MyBlock)block{
    self.MyBlock=block;
}

- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
    if ([_sureBtn.titleLabel.text isEqualToString:@"购买"]) {
        DLog(@"买土地");
    }else if ([_sureBtn.titleLabel.text isEqualToString:@"买种子"]){
        DLog(@"买种子");
    }else if ([_sureBtn.titleLabel.text isEqualToString:@"买农民"]){
        DLog(@"买农民");
    }
}
- (IBAction)chooseClick:(UIButton *)sender {
    if (sender.tag==0) {
        [UIView animateWithDuration:0.2 animations:^{
            _typeBack.center=_seedBtn.center;
            _typeBack.text=@"种子";
            _img.image=[UIImage imageNamed:@"land"];
            _ripe.hidden=YES;
            _alertLab.text=@"您还没有任何种子~";
            [_sureBtn setTitle:@"买种子" forState:0];
            [_payBtn setTitle:@"买种子" forState:0];
        }];
        
    }else if(sender.tag==1){
        [UIView animateWithDuration:0.2 animations:^{
            _typeBack.center=_boorBtn.center;
            _typeBack.text=@"农民";
            _img.image=[UIImage imageNamed:@"boor"];
            _ripe.hidden=YES;
            _alertLab.text=@"您还没有任何农民~";
            [_sureBtn setTitle:@"买农民" forState:0];
            [_payBtn setTitle:@"买农民" forState:0];
        }];
        
    }else if(sender.tag==2){
        [UIView animateWithDuration:0.2 animations:^{
            _typeBack.center=_landBtn.center;
            _typeBack.text=@"土地";
            _img.image=[UIImage imageNamed:@"land"];
            _ripe.hidden=NO;
            _alertLab.text=@"您还没有任何土地~";
            [_sureBtn setTitle:@"购买" forState:0];
            [_payBtn setTitle:@"购买土地" forState:0];
        }];
        
    }
}
- (IBAction)payClick:(UIButton *)sender {
    if ([_payBtn.titleLabel.text isEqualToString:@"购买土地"]) {
        DLog(@"买土地");
    }else if ([_payBtn.titleLabel.text isEqualToString:@"买种子"]){
        DLog(@"买种子");
    }else if ([_payBtn.titleLabel.text isEqualToString:@"买农民"]){
        DLog(@"买农民");
    }
}
- (IBAction)seedClick:(UIButton *)sender {
    DLog(@"去播种");
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
