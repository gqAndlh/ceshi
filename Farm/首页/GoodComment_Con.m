//
//  GoodComment_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "GoodComment_Con.h"

@interface GoodComment_Con ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UIView *typeView;
@property(nonatomic)UITableView *tableView;

@end

@implementation GoodComment_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect TF = _topView.frame;
    TF.size.height=NAVHEIGHT;
    _topView.frame=TF;
    [self.view bringSubviewToFront:_topView];
    CGRect TyF = _typeView.frame;
    TyF.origin.y=NAVHEIGHT+5;
    _typeView.frame=TyF;
    [self.view bringSubviewToFront:_typeView];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)typeClick:(UIButton *)sender {
    for (UIView *v  in _typeView.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)v;
            if (sender.tag==btn.tag) {
                [btn setTitleColor:[UIColor redColor] forState:0];
            }else{
                [btn setTitleColor:[UIColor blackColor] forState:0];
            }
        }
        if ([v isKindOfClass:[UILabel class]]) {
            UILabel *lab = (UILabel *)v;
            if (sender.tag==lab.tag) {
                lab.textColor=[UIColor redColor];
            }else{
                lab.textColor=[UIColor blackColor];
            }
        }
    }
//    if (sender.tag==0) {
//        
//    }else if (sender.tag==1){
//        
//    }
//    else if (sender.tag==2){
//        
//    }else if (sender.tag==3){
//        
//    }else if (sender.tag==4){
//        
//    }
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetMaxY(_typeView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-50-CGRectGetMaxY(_typeView.frame));
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
    cell.textLabel.text=[NSString stringWithFormat:@"评论%ld",indexPath.row];
    return cell;

}
- (IBAction)topMenuclick:(UIButton *)sender {
    if (sender.tag==0) {
        _con.type=0;
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender.tag==1){
        _con.type=1;
        [self.navigationController popViewControllerAnimated:YES];
    }else if (sender.tag==2){
        
    }
}
- (IBAction)likeClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else
        sender.selected=YES;
}
- (IBAction)shareclick:(UIButton *)sender {
}
- (IBAction)backClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 客服
- (IBAction)KFClick:(UIButton *)sender {
    
}
#pragma mark -店铺
- (IBAction)shopClick:(UIButton *)sender {
    ShopDetail_Con *shop=[[ShopDetail_Con alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
    [self delCon];
}
#pragma mark -购物车
- (IBAction)shopCarClick:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.tabBarController.selectedIndex=3;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark -加入购物车
- (IBAction)addCarClick:(UIButton *)sender {
}
#pragma mark - 购买
- (IBAction)payClick:(UIButton *)sender {
    
}

#pragma mark - 移除当前控制器
-(void)delCon{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
        for (UIViewController *vc in marr) {
            if (vc == self) {
                [marr removeObject:vc];
                break;          //break一定要加，不加有时候有bug
            }
        }
        self.navigationController.viewControllers = marr;
}
-(void)viewWillAppear:(BOOL)animated{
    
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
