//
//  Filtrate_View.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "Filtrate_View.h"

@implementation Filtrate_View


- (IBAction)PinkageClick:(UIButton *)sender {
    [_price1 resignFirstResponder];
    [_price2 resignFirstResponder];
    if (sender.tag==0) {
        _NOPinkage.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _Pinkage.backgroundColor=[UIColor redColor];
        [_Pinkage setTitleColor:[UIColor whiteColor] forState:0];
        [_NOPinkage setTitleColor:[UIColor blackColor] forState:0];
    }else{
        _Pinkage.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _NOPinkage.backgroundColor=[UIColor redColor];
        [_NOPinkage setTitleColor:[UIColor whiteColor] forState:0];
        [_Pinkage setTitleColor:[UIColor blackColor] forState:0];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_price1 resignFirstResponder];
    [_price2 resignFirstResponder];
    [self removeFromSuperview];
}

- (IBAction)sureClick:(UIButton *)sender {
    if (sender.tag==0) {
        _price1.text=@"";
        _price2.text=@"";
        _NOPinkage.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _Pinkage.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [_Pinkage setTitleColor:[UIColor blackColor] forState:0];
        [_NOPinkage setTitleColor:[UIColor blackColor] forState:0];
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
