//
//  ShopStreetHead_View.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "ShopStreetHead_View.h"

@implementation ShopStreetHead_View

-(void)setView:(int)num{
    if (num!=3 && num!=0) {
        for (UIButton *btn in _menuView.subviews) {
            if (btn.tag==(num/10-1)) {
                if (num%10==0) {
                    btn.selected=NO;
                }else{
                    btn.selected=YES;
                }
            }
        }
    }else{
        
    }
    
}
- (IBAction)sortClick:(UIButton *)sender {
    
    if (sender.tag!=3 && sender.tag !=0) {
        for (UIButton *btn in _menuView.subviews) {
            if (btn.tag==sender.tag) {
                if (btn.selected) {
                    btn.selected=NO;
                    self.MenuBlock(10*(sender.tag+1));

                }else{
                    btn.selected=YES;
                    self.MenuBlock((10*(sender.tag+1))+1);
                }
            }else{
                btn.selected=NO;
            }
        }
    }else if(sender.tag==0){
        self.MenuBlock(10);
    }else if (sender.tag==3){
        self.MenuBlock(40);
    }
}
- (void)returnText:(MenuBlock)block{//加上后方便第A视图书写该block方法
    _MenuBlock=block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
