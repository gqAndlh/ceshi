//
//  ShopFiltrate_View.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "ShopFiltrate_View.h"

@implementation ShopFiltrate_View


- (IBAction)typeClick:(UIButton *)sender {
    if (sender.tag==0) {
        _quitMoney.backgroundColor=[UIColor redColor];
        [_quitMoney setTitleColor:[UIColor whiteColor] forState:0];
        _approve.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_approve setTitleColor:[UIColor blackColor] forState:0];
    }else{
        _approve.backgroundColor=[UIColor redColor];
        [_approve setTitleColor:[UIColor whiteColor] forState:0];
        _quitMoney.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_quitMoney setTitleColor:[UIColor blackColor] forState:0];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self removeFromSuperview];
}

- (IBAction)sureClick:(UIButton *)sender {
    if (sender.tag==0) {
        _quitMoney.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _approve.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_quitMoney setTitleColor:[UIColor blackColor] forState:0];
        [_approve setTitleColor:[UIColor blackColor] forState:0];
    }else{
        [self removeFromSuperview];
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
