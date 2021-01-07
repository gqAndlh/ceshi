//
//  MyOrder_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "MyOrder_Con.h"
#import "MyOrder_Cell.h"
#import "OrderDetail_Con.h"

@interface MyOrder_Con ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIScrollView *menuScrView;
@property (weak, nonatomic) IBOutlet UIView *line;

@end

@implementation MyOrder_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的订单";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
-(void)creatView{
    NSArray *arr=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",@"已完成",@"取消拒收", nil];
    for (int i = 0; i<arr.count; i++) {
        UIButton *btn=[[UIButton alloc]init];
        btn.frame=CGRectMake(i*100, 0, 100, 40);
        btn.tag=i;
        [btn setTitle:arr[i] forState:0];
        if (_type==i) {
            [btn setTitleColor:[UIColor redColor] forState:0];
        }else
            [btn setTitleColor:[UIColor blackColor] forState:0];
        btn.titleLabel.font=MyFont(14);
        [_menuScrView addSubview:btn];
        [btn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    }
    _menuScrView.contentSize=CGSizeMake(arr.count*100, 50);
    CGRect LF = _line.frame;
    LF.origin.x = _type*100+40;
    _line.frame=LF;
}
-(void)clickMenu:(UIButton *)btn{
    _type=btn.tag;
    CGRect LF = _line.frame;
    LF.origin.x = btn.center.x-10;
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
    for (UIView *v in _menuScrView.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *btn1 = (UIButton *)v;
            if (btn1.tag==btn.tag) {
                [btn1 setTitleColor:[UIColor redColor] forState:0];
            }else{
                [btn1 setTitleColor:[UIColor blackColor] forState:0];
            }
        }
    }
    [_tableView reloadData];
    
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetHeight(_menuScrView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetHeight(_menuScrView.frame));
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
    MyOrder_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"MyOrder_Cell" owner:self options:nil].firstObject;
    }
    cell.state=_type;
    cell.ISsell=NO;
    cell.dic=nil;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OrderDetail_Con *detail=[[OrderDetail_Con alloc]init];
    detail.state=_type;
    [self.navigationController pushViewController:detail animated:YES];
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
