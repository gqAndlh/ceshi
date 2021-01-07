//
//  ShopStreet_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "ShopStreet_Con.h"
#import "AttentionShop_Cell.h"
#import "ShopStreetHead_View.h"
#import "ShopFiltrate_View.h"
@interface ShopStreet_Con ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
    UISearchBar *customSearchBar;
    int sort;
}
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIView *searchContent;
@end

@implementation ShopStreet_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    sort=10;
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
    
    ShopStreetHead_View *header = [[[NSBundle mainBundle]loadNibNamed:@"ShopStreetHead_View" owner:nil options:nil]lastObject];
    [header setView:sort];
    header.MenuBlock = ^(NSInteger type) {
        DLog(@"%ld",type);
        if (type==40) {
            ShopFiltrate_View *header = [[[NSBundle mainBundle]loadNibNamed:@"ShopFiltrate_View" owner:nil options:nil]lastObject];
            header.frame=[UIApplication sharedApplication].keyWindow.bounds;
            [[UIApplication sharedApplication].keyWindow addSubview:header];
        }
    };
    self.tableView.tableHeaderView=header;
    // Do any additional setup after loading the view.
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
    AttentionShop_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"AttentionShop_Cell" owner:self options:nil].firstObject;
    }
    cell.chooseBtn.hidden=YES;
    cell.shopBtn.tag=indexPath.row;
    cell.GoodBlock = ^(NSInteger index) {
        DLog(@"%ld--%ld",indexPath.row,index);
        GoodDetail_Con *good=[[GoodDetail_Con alloc]init];
        [self.navigationController pushViewController:good animated:YES];
    };
    [cell.shopBtn addTarget:self action:@selector(ShopClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)ShopClick:(UIButton *)btn{
    ShopDetail_Con *shop=[[ShopDetail_Con alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
}
-(void)chooseClick:(UIButton *)btn{
    if (btn.selected) {
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(0)];
    }else{
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(1)];
    }
    [_tableView reloadData];
}
#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<20; i++) {
        [_dataArray addObject:@(0)];
    }
    [_tableView reloadData];
}
-(void)searchView{
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 27+(Is_iPhoneX?28:0), SCREEN_WIDTH-60, 30)];
    customSearchBar.placeholder=@"按关键字搜索店铺";
    customSearchBar.showsCancelButton = NO;
    customSearchBar.delegate=self;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
    
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
//    Search_Con *search=[[Search_Con alloc]init];
//    search.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:search animated:YES];
    _searchContent.hidden=NO;
    _tableView.hidden=YES;
    return YES;
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    customSearchBar.text=@"";
    [customSearchBar resignFirstResponder];
    _searchContent.hidden=YES;
    _tableView.hidden=NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [self searchView];
}

-(void)viewWillDisappear:(BOOL)animated{
    [customSearchBar removeFromSuperview];

}

#pragma mark - 按类型收缩
- (IBAction)SearchTypeClick:(UIButton *)sender {
    customSearchBar.text=@"";
    [customSearchBar resignFirstResponder];
    _searchContent.hidden=YES;
    _tableView.hidden=NO;
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
