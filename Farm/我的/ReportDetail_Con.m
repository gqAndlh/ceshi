//
//  ReportDetail_Con.m
//  Farm
//
//  Created by mac on 2020/12/30.
//

#import "ReportDetail_Con.h"
#import "ReportAlert_Con.h"
#import "HUPhotoBrowser.h"

@interface ReportDetail_Con ()
@property (weak, nonatomic) IBOutlet UIScrollView *backView;
@property (weak, nonatomic) IBOutlet UIView *picView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UIView *downView;
@property(nonatomic)NSMutableArray *picArr;
@property(nonatomic)int state;//状态
@end

@implementation ReportDetail_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"举报详情";
    _state=1;
    _picArr=[NSMutableArray arrayWithObjects:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=384578138,2985306574&fm=26&gp=0.jpg",@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=323600945,481798035&fm=26&gp=0.jpg",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.wndhw.com%2Ffengjing%2Fshanshui%2Fimages%2Fss010t8.jpg&refer=http%3A%2F%2Fwww.wndhw.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611550262&t=804c65ee4dd229db59afc0a4011d35fc",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.sucai.biz%2F170303%2F1-1F303231U4.jpg&refer=http%3A%2F%2Fimg.sucai.biz&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611550262&t=56b8e0ab25001cbf490c7e472e02d4e7", nil];
    if (_state==0) {
        _one.layer.borderWidth=1;
        _one.layer.borderColor=[UIColor redColor].CGColor;
        _two.layer.borderWidth=1;
        _two.layer.borderColor=[UIColor grayColor].CGColor;
        _three.layer.borderWidth=1;
        _three.layer.borderColor=[UIColor grayColor].CGColor;
    }else if (_state==1){
        _one.layer.borderWidth=1;
        _one.layer.borderColor=[UIColor redColor].CGColor;
        _two.layer.borderWidth=1;
        _two.layer.borderColor=[UIColor redColor].CGColor;
        _three.layer.borderWidth=1;
        _three.layer.borderColor=[UIColor grayColor].CGColor;

    }else if (_state==3){
        _one.layer.borderWidth=1;
        _one.layer.borderColor=[UIColor redColor].CGColor;
        _two.layer.borderWidth=1;
        _two.layer.borderColor=[UIColor redColor].CGColor;
        _three.layer.borderWidth=1;
        _three.layer.borderColor=[UIColor redColor].CGColor;
    }
    
    for (UILabel *lab in _topView.subviews) {
        if (lab.tag<=_state) {
            lab.textColor=[UIColor redColor];
        }
        
    }
    [self showPics];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - 图片显示
-(void)showPics{
    
    int w = (SCREEN_WIDTH-30)/3;
    for (int i = 0; i<_picArr.count; i++) {
        UIImageView *btn=[[UIImageView alloc]init];
        btn.frame=CGRectMake((i%3)*(w+5), (i/3)*w, w-20, w-20);
        [_picView addSubview:btn];
        btn.userInteractionEnabled=YES;
        btn.tag=i;
//        [btn addTarget:self action:@selector(BigPicClick:) forControlEvents:UIControlEventTouchUpInside];
//        [btn sd_setImageWithURL:[NSURL URLWithString:_picArr[i]] forState:0 placeholderImage:[UIImage imageNamed:@""]];
        [btn sd_setImageWithURL:[NSURL URLWithString:_picArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(BigPicClick:)];
         tapRecognize.numberOfTapsRequired = 1;
        [btn addGestureRecognizer:tapRecognize];
        CGRect PF = _picView.frame;
        if (_picArr.count%3==0) {
        PF.size.height=(_picArr.count/3)*w;
        }else{
            PF.size.height=(_picArr.count/3+1)*w;
        }
        _picView.frame=PF;
        
        CGRect DF = _downView.frame;
        DF.size.height = CGRectGetMaxY(_picView.frame)+60;
        _downView.frame=DF;
        _backView.contentSize=CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(_downView.frame));
    }
}
-(void)BigPicClick:(UITapGestureRecognizer *)tap{
    DLog(@"%ld",tap.view.tag);
    [HUPhotoBrowser showFromImageView:tap.view withURLStrings:_picArr placeholderImage:[UIImage imageNamed:@"placeholder"] atIndex:tap.view.tag dismiss:nil];
    
}

#pragma mark - 举报须知
- (IBAction)noteClick:(UIButton *)sender {
    [self.navigationController pushViewController:[ReportAlert_Con new] animated:YES];
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
