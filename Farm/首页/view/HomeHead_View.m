//
//  HomeHead_View.m
//  Farm
//
//  Created by mac on 2020/12/16.
//

#import "HomeHead_View.h"

@implementation HomeHead_View

-(void)creatView{
    NSArray *arr=[NSArray arrayWithObjects:@"热销商品",@"食品",@"电器",@"药茶",@"钟表",@"其他", nil];
    for (int i = 0; i<arr.count; i++) {
        UIButton *btn=[[UIButton alloc]init];
        btn.frame=CGRectMake(i*100, 0, 100, 40);
        btn.tag=i;
        [btn setTitle:arr[i] forState:0];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.font=MyFont(14);
        [_scr addSubview:btn];
        [btn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    }
    _scr.contentSize=CGSizeMake(arr.count*100, 50);
    CGRect LF = _line.frame;
    LF.origin.x = 40;
    _line.frame=LF;
}
-(void)clickMenu:(UIButton *)btn{
    CGRect LF = _line.frame;
    LF.origin.x = btn.center.x-10;
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
    self.MenuBlock(btn.tag);
}
- (IBAction)noticeClick:(UIButton *)sender {
    self.MenuBlock(50);
}

- (IBAction)typeClick:(UIButton *)sender {
    self.MenuBlock(10*(sender.tag+1));
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
