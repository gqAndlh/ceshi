//
//  BalanceAgold_Con.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "BalanceAgold_Con.h"
#import "BalanceAgold_Cell.h"
#import "BalanceAgold_View.h"
#import "BeanInfo_View.h"
#import "DelegationDetail_Con.h"

@interface BalanceAgold_Con ()<UITableViewDelegate,UITableViewDataSource>
{
    BeanInfo_View *BeanInfo;
    BalanceAgold_View *BalanceAgold;
}
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)UILabel*alertLab;

@end

@implementation BalanceAgold_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.tableView];
    _dataArray = [NSMutableArray array];
    [self alertView];
//    [self requestData];
    if (_type==2) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"委托明细" style:UIBarButtonItemStyleDone target:self action:@selector(detail)];
        right.tintColor=[UIColor blackColor];
        [right setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem=right;
        
        BeanInfo=[[[NSBundle mainBundle]loadNibNamed:@"BeanInfo_View" owner:nil options:nil]lastObject];
        self.tableView.tableHeaderView=BeanInfo;
        BeanInfo.BeanBlock = ^(NSString *showText) {
            DLog(@"兑换金币");
        };
        BeanInfo.dic=nil;
    }else{
        BalanceAgold=[[[NSBundle mainBundle]loadNibNamed:@"BalanceAgold_View" owner:nil options:nil]lastObject];
        self.tableView.tableHeaderView=BalanceAgold;
        BalanceAgold.type=_type;
        BalanceAgold.dic=nil;
    }
    
    // Do any additional setup after loading the view.
}
#pragma mark - 委托明细
-(void)detail{
    [self.navigationController pushViewController:[DelegationDetail_Con new] animated:YES];
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT);
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
//无数据提示
-(void)alertView{
    CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-((_type==2)?224:190));
    _alertLab=[[UILabel alloc]initWithFrame:frame];
    _alertLab.textAlignment=NSTextAlignmentCenter;
    _alertLab.textColor=[PubLic_Class colorWithHexString:@"#999999"];
    if (_type==0) {
        _alertLab.text=@"余额啥也没有～";
    }else if (_type==1){
        _alertLab.text=@"您还没有金币～";
    }else if (_type==2){
        _alertLab.text=@"您还没有云豆～";
    }else if (_type==3){
        _alertLab.text=@"您还没有积分～";
    }
}

#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    BalanceAgold_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"BalanceAgold_Cell" owner:self options:nil].firstObject;
    }
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
//-(void)viewDidDisappear:(BOOL)animated{
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//}

-(void)requestData{
    if (_dataArray.count==0) {
        self.tableView.tableFooterView=self.alertLab;
    }else{
        self.tableView.tableFooterView=nil;
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
