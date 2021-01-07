//
//  FarmHome_Con.m
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import "FarmHome_Con.h"
#import "LandView.h"
#import "PayLand_view.h"
#import "PayBoorASeed_View.h"
#import "MyNc_view.h"
#import "More_View.h"
#import "Alert_View.h"
#import "myInfo_Con.h"
#import "BalanceAgold_Con.h"
#import "Trans_Con.h"
#import "MyCapital_Con.h"

#import <AVFoundation/AVFoundation.h>

@interface FarmHome_Con ()<AVAudioPlayerDelegate>
{
    BOOL isPlay;
}
@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UIView *JBView;
@property (weak, nonatomic) IBOutlet UIScrollView *backScrView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrView;
@property (weak, nonatomic) IBOutlet UIButton *muiceBtn;
@property (nonatomic)AVAudioPlayer *player;


@end

@implementation FarmHome_Con

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[PubLic_Class colorWithHexString:@"#B9F871"];
    self.title=@"我的农场";
    [self playClick:nil];
    if (@available(iOS 11, *)) {
          self.backScrView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
     } else {
          self.automaticallyAdjustsScrollViewInsets = NO;
     }
    CGRect TF = _infoView.frame;
    TF.size.height = Is_iPhoneX ?TF.size.height : TF.size.height-20;
    _infoView.frame=TF;
    
    CGRect DF = _downView.frame;
    DF.origin.y = SCREEN_HEIGHT-CGRectGetHeight(_downView.frame)-TABBARHEIGHT;
    _downView.frame=DF;
    
    [self creatLandView];
    [self getPlayer];
//    [self setLayerColorWithView:self.JBView ViewSize:CGSizeMake(SCREEN_WIDTH, 128) StartColor:[UIColor blackColor] StartPoint:CGPointMake(0.5, 0) EndColor:[UIColor clearColor] EndPoint:CGPointMake(0.5, 1)];
    // Do any additional setup after loading the view from its nib.
}

//播放背景音乐
- (void)getPlayer
{
    /* 获取本地文件 */
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *urlString = [bundle pathForResource:@"backMusic" ofType:@"mp3"];
    /* 初始化url */
    NSURL *url = [[NSURL alloc] initFileURLWithPath:urlString];
    /* 初始化音频文件 */
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.player.delegate=self;
    /* 加载缓冲 */
    [self.player prepareToPlay];
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    DLog(@"播放完成");
    [self.player play];
}
- (IBAction)playClick:(UIButton *)sender {
    if (isPlay) {
        [self stopAnimation];
        [self.player pause];
        isPlay=NO;
    }else{
        [self startAnimation];
        [self.player play];
        isPlay=YES;
    }
    
}
- (void)startAnimation
{
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 5;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.removedOnCompletion = NO;
    [_muiceBtn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation
{
    [_muiceBtn.layer removeAllAnimations];
}
//创建土地
-(void)creatLandView{
    for (UIView *v in _contentScrView.subviews) {
        [v removeFromSuperview];
    }
    for (int i = 0; i < 100; i++) {
        int w = (SCREEN_WIDTH-50)/5*2;
        int h = w/3*2;
        int top =10;
        LandView *land=[[[NSBundle mainBundle]loadNibNamed:@"LandView" owner:self options:nil]lastObject];
        land.backgroundColor=[UIColor clearColor];
        land.index=i;
        if ((i/2)%2==0) {
            if (i/2==0) {
                land.frame=CGRectMake((i%2)*w,(i/2)*h+top, w, h);
            }else{
                land.frame=CGRectMake((i%2)*w,(i/2)*(h-(h/2))+top, w, h);
            }
            
        }else{
            land.frame=CGRectMake((w/2)+(i%2)*w,(i/2)*(h-(h/2))+top, w, h);
        }
        land.LockBtn.tag=i;
        [land.LockBtn addTarget:self action:@selector(LockClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentScrView addSubview:land];
        _contentScrView.contentSize=CGSizeMake(0, (100/4)*h+(h/2)+top+50);
        UIImage *image = [UIImage imageNamed:@"NC_back"];
        CGFloat topF = 300; // 顶端盖高度
        CGFloat bottom = 300 ; // 底端盖高度
        CGFloat left = 0; // 左端盖宽度
        CGFloat right = 0; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(topF, left, bottom, right);
        image=[image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        CGRect CF = _contentScrView.frame;
        CF.size.height = (100/4)*h+(h/2)+top+120;
        _contentScrView.frame=CF;
        
        CGRect IF = _img.frame;
        IF.size.height = CGRectGetMaxY(_contentScrView.frame)+100;
        _img.frame=IF;
        _img.image=image;
        _backScrView.contentSize=CGSizeMake(SCREEN_WIDTH,CGRectGetMaxY(_contentScrView.frame)+100);
    }
}
- (IBAction)InfoClick:(UIButton *)sender {
    if (sender.tag==0) {
        MyCapital_Con *MyCapital=[[MyCapital_Con alloc]init];
        MyCapital.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:MyCapital animated:YES];
    }else if (sender.tag==1){
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"我的金币";
        Bg.type=sender.tag;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }else if (sender.tag){
        BalanceAgold_Con *Bg=[[BalanceAgold_Con alloc]init];
        Bg.title=@"我的云豆";
        Bg.type=sender.tag;
        Bg.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:Bg animated:YES];
    }
}
//购买土地
-(void)LockClick:(UIButton *)btn{
    PayLand_view *payLand=[[[NSBundle mainBundle]loadNibNamed:@"PayLand_view" owner:nil options:nil]lastObject];
    payLand.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [payLand creatView];
    [[UIApplication sharedApplication].keyWindow addSubview:payLand];
}

//交易，我的，市场
- (IBAction)menuClick:(UIButton *)sender {
    if (sender.tag==0) {
        DLog(@"交易");
        Trans_Con *trans=[[Trans_Con alloc]init];
        trans.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:trans animated:YES];
    }else if (sender.tag==1){
        DLog(@"我的");
        myInfo_Con *my=[[myInfo_Con alloc]init];
        my.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:my animated:YES];
//        MyNc_view *nc=[[[NSBundle mainBundle]loadNibNamed:@"MyNc_view" owner:nil options:nil]lastObject];
//        nc.frame=[UIApplication sharedApplication].keyWindow.bounds;
//        [nc creatView];
//        [[UIApplication sharedApplication].keyWindow addSubview:nc];
    }else if (sender.tag==2){
        DLog(@"市场");
        [self payBoorAseed:NO];
    }
}
#pragma mark - 购买种子和农民
-(void)payBoorAseed:(BOOL)isBoor{
    PayBoorASeed_View *pay=[[[NSBundle mainBundle]loadNibNamed:@"PayBoorASeed_View" owner:nil options:nil]lastObject];
    pay.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [pay creatView];
    pay.isBoor=isBoor;
    [[UIApplication sharedApplication].keyWindow addSubview:pay];
}
#pragma mark - 更多
- (IBAction)moreClick:(UIButton *)sender {
    More_View *more=[[[NSBundle mainBundle]loadNibNamed:@"More_View" owner:nil options:nil]lastObject];
    more.frame=[UIApplication sharedApplication].keyWindow.bounds;
    more.MyBlock = ^(NSString * _Nonnull showText) {
        [self creatLandView];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:more];
}

#pragma mark -//播种
- (IBAction)seedClick:(UIButton *)sender {
    Alert_View *alert=[[[NSBundle mainBundle]loadNibNamed:@"Alert_View" owner:nil options:nil]lastObject];
    alert.frame=[UIApplication sharedApplication].keyWindow.bounds;
    alert.isBoor=YES;
    alert.AlertBlock = ^(NSString * _Nonnull showText) {
        if ([showText isEqualToString:@"0"]) {
            [self payBoorAseed:YES];
        }else{
            [self payBoorAseed:NO];
        }
    };
    [[UIApplication sharedApplication].keyWindow addSubview:alert];
}
#pragma mark - 收云豆
- (IBAction)receiveClick:(UIButton *)sender {
    DLog(@"收云豆");
    [PubLic_Class addMBProgressViewTitle:@"收取成功" inView:self.view alpha:0.8 hideDelayTime:2];
    [self creatLandView];
}
-(void)viewWillDisappear:(BOOL)animated{
    [self.player pause];
}
-(void)viewWillAppear:(BOOL)animated{
    isPlay=NO;
    [self playClick:nil];
//    [self.navigationController.navigationBar setBackgroundImage:[PubLic_Class imageWithColor:RGBA(0, 0, 0, 0.3)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//设置背景渐变
-(void)setLayerColorWithView:(UIView*)view ViewSize:(CGSize)size StartColor:(UIColor *)startColor StartPoint:(CGPoint)startPoint EndColor:(UIColor *)endColor EndPoint:(CGPoint)endPoint{

//    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(1, 0);
//    [gradientLayer setColors:@[(id)[startColor CGColor],(id)[endColor CGColor]]];//渐变数组
//    [view.layer insertSublayer:gradientLayer atIndex:0];
    
    //为透明度设置渐变效果
//        UIColor *colorOne = [UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:1.0];
//        UIColor *colorTwo = [UIColor colorWithRed:(0/255.0)  green:(0/255.0)  blue:(0/255.0)  alpha:0.0];
//        NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor, nil];
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        //设置开始和结束位置(设置渐变的方向)
//        gradient.startPoint = CGPointMake(1, 0);
//        gradient.endPoint = CGPointMake(0, 1);
//        gradient.colors = colors;
//        gradient.frame = CGRectMake(0, 0, size.width, size.height);
//        [view.layer insertSublayer:gradient atIndex:0];
    
    
}
@end
