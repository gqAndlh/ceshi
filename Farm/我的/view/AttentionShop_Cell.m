//
//  AttentionShop_Cell.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "AttentionShop_Cell.h"
#import "StarSliderView.h"

@implementation AttentionShop_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    _shopBtn.layer.cornerRadius=12;
    _shopBtn.layer.borderWidth=1;
    _shopBtn.layer.borderColor=[UIColor redColor].CGColor;
    int num = arc4random() % 6;
    StarSliderView *star = [[StarSliderView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.startView.frame), CGRectGetHeight(self.startView.frame)) andWithCurrentStarNum:num andUserEnabled:NO andWithDistance:5];
    [self.startView addSubview:star];
    int shopnum = arc4random() % 3+1;
    for (UIView *v  in _shopView.subviews) {
        if (v.tag>shopnum) {
            v.hidden=YES;
        }
    }
    // Initialization code
}

- (IBAction)goodClick:(UIButton *)sender {
    self.GoodBlock(sender.tag);
}

-(void)returnText:(GoodBlock)block{
    self.GoodBlock=block;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
