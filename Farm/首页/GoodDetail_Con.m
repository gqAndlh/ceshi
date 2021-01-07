//
//  GoodDetail_Con.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "GoodDetail_Con.h"
#import "GoodDetailHead_View.h"
#import "ShopDetail_Con.h"
#import "GoodComment_Con.h"
#import "Advisory_Con.h"
#import "ShopGoodSearch_Con.h"
#import "AddaPay_View.h"
#import "SureOrder_Con.h"
#import "ReportShop_Con.h"

@interface GoodDetail_Con ()<UITableViewDelegate,UITableViewDataSource>
{
    float HeadHeight;
}
@property(nonatomic)UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;

@end

@implementation GoodDetail_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    CGRect TF = _topView.frame;
    TF.size.height=NAVHEIGHT;
    _topView.frame=TF;
    [self.view bringSubviewToFront:_topView];
    GoodDetailHead_View *head=[[[NSBundle mainBundle]loadNibNamed:@"GoodDetailHead_View" owner:nil options:nil]lastObject];
    [head creatView];
    head.GoodBlock = ^(NSString * _Nonnull showText) {
        if ([showText intValue]==100) {
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            [self.navigationController popViewControllerAnimated:YES];
        }else if ([showText intValue]==200){
            DLog(@"全部商品");
            [self.navigationController setNavigationBarHidden:NO animated:nil];
            ShopGoodSearch_Con *search=[[ShopGoodSearch_Con alloc]init];
            [self.navigationController pushViewController:search animated:YES];
        }else if ([showText intValue]==300){
            DLog(@"店铺");
            ShopDetail_Con *shop=[[ShopDetail_Con alloc]init];
            [self.navigationController pushViewController:shop animated:YES];
        }else if ([showText intValue]==400){
            DLog(@"评价");
            GoodComment_Con*good=[[GoodComment_Con alloc]init];
            good.con=self;
            [self.navigationController pushViewController:good animated:YES];
        }else if ([showText intValue]==500){
            DLog(@"咨询");
            Advisory_Con *Advisory=[[Advisory_Con alloc]init];
            [self.navigationController pushViewController:Advisory animated:YES];
        }else if ([showText intValue]==600){
            DLog(@"举报");
            ReportShop_Con *rep=[[ReportShop_Con alloc]init];
            [self.navigationController pushViewController:rep animated:YES];
        }else if ([showText intValue]==700){
            DLog(@"首页");
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            self.navigationController.tabBarController.selectedIndex=0;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else if ([showText intValue]==800){
            DLog(@"分类");
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            self.navigationController.tabBarController.selectedIndex=1;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else if ([showText intValue]==900){
            DLog(@"购物车");
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            self.navigationController.tabBarController.selectedIndex=3;
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }else if ([showText intValue]==1000){
            DLog(@"关注");
            
        }
    };
    HeadHeight = CGRectGetHeight(head.frame);
    self.tableView.tableHeaderView=head;
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50);
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.showsVerticalScrollIndicator=NO;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _tableView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text=[NSString stringWithFormat:@"商品介绍%ld",indexPath.row];
    return cell;

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    DLog(@"%f",scrollView.contentOffset.y);
    if (_tableView.contentOffset.y<NAVHEIGHT) {
        _topView.hidden=YES;
    }else{
        _topView.hidden=NO;
    }
    CGRect LF = _line.frame;
    if (_tableView.contentOffset.y>=HeadHeight) {
        LF.origin.x=_detailBtn.center.x-10;
    }else{
        LF.origin.x=_shopBtn.center.x-10;
    }
    [UIView animateWithDuration:0.1 animations:^{
            _line.frame=LF;
    }];
}

#pragma mark - 客服
- (IBAction)KFClick:(UIButton *)sender {
    
}
#pragma mark -店铺
- (IBAction)shopClick:(UIButton *)sender {
    ShopDetail_Con *shop=[[ShopDetail_Con alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
}
#pragma mark -购物车
- (IBAction)shopCarClick:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.tabBarController.selectedIndex=3;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark -加入购物车
- (IBAction)addCarClick:(UIButton *)sender {
    AddaPay_View *pay=[[[NSBundle mainBundle]loadNibNamed:@"AddaPay_View" owner:nil options:nil]lastObject];
    pay.frame=[UIApplication sharedApplication].keyWindow.bounds;
    pay.PayBlock = ^(NSString * _Nonnull showText) {
        
    };
    [[UIApplication sharedApplication].keyWindow addSubview:pay];
}
#pragma mark - 购买
- (IBAction)payClick:(UIButton *)sender {
    AddaPay_View *pay=[[[NSBundle mainBundle]loadNibNamed:@"AddaPay_View" owner:nil options:nil]lastObject];
    pay.frame=[UIApplication sharedApplication].keyWindow.bounds;
    pay.PayBlock = ^(NSString * _Nonnull showText) {
        SureOrder_Con *order=[[SureOrder_Con alloc]init];
        [self.navigationController pushViewController:order animated:YES];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:pay];
}


- (IBAction)topMenuClick:(UIButton *)sender {
//    CGRect LF = _line.frame;
//    LF.origin.x=sender.center.x-10;
//    if (sender.tag!=2) {
//        [UIView animateWithDuration:0.3 animations:^{
//                _line.frame=LF;
//        }];
//    }
//    
    if (sender.tag==0) {
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:YES];
    }else if (sender.tag==1){
        [self.tableView setContentOffset:CGPointMake(0, HeadHeight) animated:YES];
    }else if (sender.tag==2){
        GoodComment_Con*good=[[GoodComment_Con alloc]init];
        good.con=self;
        [self.navigationController pushViewController:good animated:YES];
    }
}
- (IBAction)backClick:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)LikeClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else
        sender.selected=YES;
}
- (IBAction)shareClick:(UIButton *)sender {
}
-(void)viewWillAppear:(BOOL)animated{
    
    if (_type==0) {
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
    }else{
        [self.tableView setContentOffset:CGPointMake(0, HeadHeight) animated:NO];
    }
    [self.navigationController setNavigationBarHidden:YES animated:nil];

}
-(void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:nil];

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
