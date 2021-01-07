//
//  OrderDetail_Con.m
//  Farm
//
//  Created by mac on 2020/12/28.
//

#import "OrderDetail_Con.h"

@interface OrderDetail_Con ()
@property (weak, nonatomic) IBOutlet UIView *stateView;
@property (weak, nonatomic) IBOutlet UIView *addressView;
@property (weak, nonatomic) IBOutlet UIView *shopView;
@property (weak, nonatomic) IBOutlet UIView *orderView;

@property (weak, nonatomic) IBOutlet UIView *lineBack;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrView;
@property (weak, nonatomic) IBOutlet UIButton *addCar;
@property (weak, nonatomic) IBOutlet UIView *downView;




@end

@implementation OrderDetail_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"订单详情";
    [self creatView];
    _backScrView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_downView.frame));
    // Do any additional setup after loading the view from its nib.
}
-(void)creatView{
    _addCar.layer.cornerRadius=12;
    _addCar.layer.borderWidth=1;
    _addCar.layer.borderColor=[UIColor grayColor].CGColor;
    if (_state==6) {
        _stateView.hidden=YES;
    }
    if (_stateView.hidden) {
        CGRect AF = _addressView.frame;
        AF.origin.y = 10;
        _addressView.frame=AF;
        
        CGRect SF = _shopView.frame;
        SF.origin.y = CGRectGetMaxY(_addressView.frame)+10;
        _shopView.frame=SF;
        
        CGRect OF = _orderView.frame;
        OF.origin.y = CGRectGetMaxY(_shopView.frame)+10;
        _orderView.frame=OF;
        
        CGRect DF = _downView.frame;
        DF.origin.y = CGRectGetMaxY(_orderView.frame)+10;
        _downView.frame=DF;
    }else{
        [self creatStateView];
    }
    
}
-(void)creatStateView{
    int a = 4;
    for (UIView *v in _stateView.subviews) {
        if (v.tag>0 && v.tag<=a) {
            if ([v isKindOfClass:[UIButton class]]) {
                UIButton *btn=(UIButton *)v;
                btn.selected=YES;
            }
        }
        if (a==4) {
            CGRect LF = _line.frame;
            LF.size.width=SCREEN_WIDTH-30;
            _line.frame=LF;
        }else{
            if (v.tag==a) {
                CGRect LF = _line.frame;
                LF.size.width=v.center.x-15;
                _line.frame=LF;
            }
            
        }
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
