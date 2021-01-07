//
//  Trans_Con.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "Trans_Con.h"
#import "Trans_Cell.h"
#import "DelegationTrans_View.h"
#import "Payripe_View.h"
#import "DelegationAlert_View.h"
#import "DelegationDetail_Con.h"

@interface Trans_Con ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UILabel*alertLab;

@end

@implementation Trans_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"交易市场";
    [self.view addSubview:self.tableView];
    [self.view sendSubviewToBack:self.tableView];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"委托明细" style:UIBarButtonItemStyleDone target:self action:@selector(detail)];
    right.tintColor=[UIColor blackColor];
    [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=right;
    
    _dataArray=[NSMutableArray array];
    [self alertView];
    [self requestData];
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetMaxY(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetMaxY(_topView.frame));
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
#pragma mark - 委托明细
-(void)detail{
    [self.navigationController pushViewController:[DelegationDetail_Con new] animated:YES];
}
//无数据提示
-(void)alertView{
    CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetMaxY(_topView.frame));
    _alertLab=[[UILabel alloc]initWithFrame:frame];
    _alertLab.textAlignment=NSTextAlignmentCenter;
    _alertLab.textColor=[PubLic_Class colorWithHexString:@"#999999"];
    _alertLab.text=@"还没有人发布委托～";
}
#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    Trans_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"Trans_Cell" owner:self options:nil].firstObject;
    };
    if (indexPath.row%2==1) {
        cell.backgroundColor=[PubLic_Class colorWithHexString:@"#F7F7F7"];
    }
//    cell.dic=nil;
    cell.tag=indexPath.row;
    [cell.payBtn addTarget:self action:@selector(payClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)payClick:(UIButton *)btn{
    Payripe_View *pay=[[[NSBundle mainBundle]loadNibNamed:@"Payripe_View" owner:nil options:nil]lastObject];
    pay.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:pay];
    [pay creatView];
    pay.PayBlock = ^(NSString * _Nonnull showText) {
        DLog(@"买云豆");
        if (_dataArray.count>0) {
            [_dataArray removeObjectAtIndex:0];
        }
        [self requestData];
    };
}
- (IBAction)delegationClick:(UIButton *)sender {
    DelegationAlert_View *alert=[[[NSBundle mainBundle]loadNibNamed:@"DelegationAlert_View" owner:nil options:nil]lastObject];
    alert.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:alert];
    [alert creatView];
    alert.alertBlock = ^(NSString * _Nonnull showText) {
        [_dataArray addObject:@"1"];
        [self requestData];
    };
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
-(void)requestData{
    if (_dataArray.count==0) {
        self.tableView.tableFooterView=self.alertLab;
    }else{
        self.tableView.tableFooterView=nil;
    }
    [_tableView reloadData];
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
