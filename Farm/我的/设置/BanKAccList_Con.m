//
//  BanKAccList_Con.m
//  Farm
//
//  Created by mac on 2020/12/19.
//

#import "BanKAccList_Con.h"
#import "MyDrawAcc_Cell.h"

@interface BanKAccList_Con ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

@implementation BanKAccList_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"提现账号";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
    // Do any additional setup after loading the view from its nib.
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    MyDrawAcc_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"MyDrawAcc_Cell" owner:self options:nil].firstObject;
    }
    if (indexPath.row%2==0) {
        cell.backView.backgroundColor=[UIColor redColor];
    }else{
        cell.backView.backgroundColor=[UIColor blueColor];
    }
    cell.delBtn.hidden=YES;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _con.AccStr=@"********1123";
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<20; i++) {
        [_dataArray addObject:@(0)];
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
