//
//  ShopMenuHead_View.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "ShopMenuHead_View.h"

@implementation ShopMenuHead_View

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setView:(int)num{
    for (UIButton *btn in _menuView.subviews) {
        if (btn.tag==(num/10-1)) {
            if (num%10==0) {
                btn.selected=NO;
            }else{
                btn.selected=YES;
            }
        }
    }
//    _menuView.layer.borderWidth=1;
//    _menuView.layer.borderColor=[UIColor whiteColor].CGColor;
}
- (IBAction)sortClick:(UIButton *)sender {
    
    
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
//    if (sender.tag==0) {
//        _numBtn.selected=NO;
//        _lvBtn.selected=NO;
//        _timeBtn.selected=NO;
//        if (_activeBtn.selected) {
//            _activeBtn.selected=NO;
//            self.MenuBlock(10);
//        }else{
//            _activeBtn.selected=YES;
//            self.MenuBlock(11);
//        }
//    }else if(sender.tag==1){
//        _activeBtn.selected=NO;
//        _lvBtn.selected=NO;
//        _timeBtn.selected=NO;
//        if (_numBtn.selected) {
//            _numBtn.selected=NO;
//            self.MenuBlock(20);
//        }else{
//            _numBtn.selected=YES;
//            self.MenuBlock(21);
//        }
//    }else if(sender.tag==2){
//        _activeBtn.selected=NO;
//        _numBtn.selected=NO;
//        _timeBtn.selected=NO;
//        if (_lvBtn.selected) {
//            _lvBtn.selected=NO;
//            self.MenuBlock(30);
//        }else{
//            _lvBtn.selected=YES;
//            self.MenuBlock(31);
//        }
//    }else if(sender.tag==3){
//        _activeBtn.selected=NO;
//        _numBtn.selected=NO;
//        _lvBtn.selected=NO;
//        if (_timeBtn.selected) {
//            _timeBtn.selected=NO;
//            self.MenuBlock(40);
//        }else{
//            _timeBtn.selected=YES;
//            self.MenuBlock(41);
//        }
//    }
//
    
    
}
- (void)returnText:(MenuBlock)block{//加上后方便第A视图书写该block方法
    _MenuBlock=block;
}
@end
