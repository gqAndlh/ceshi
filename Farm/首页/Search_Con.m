//
//  Search_Con.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "Search_Con.h"
#import "Search_Cell.h"
#import "Home_Cell.h"
#import "Menu_View.h"
#import "Filtrate_View.h"

@interface Search_Con ()<UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UISearchBar *customSearchBar;
    BOOL isList;
    int sort;
}
@property (nonatomic)UICollectionView *collectionView;
@property(nonatomic,strong)UITableView*tableView;
@property (nonatomic)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UIView *hotView;

@end

@implementation Search_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    sort=11;
    Menu_View *header = [[[NSBundle mainBundle]loadNibNamed:@"Menu_View" owner:nil options:nil]lastObject];
    [header setView:sort];
    header.MenuBlock = ^(NSInteger type) {
        DLog(@"%ld",type);
        if (type==40) {
            Filtrate_View *header = [[[NSBundle mainBundle]loadNibNamed:@"Filtrate_View" owner:nil options:nil]lastObject];
            header.frame=[UIApplication sharedApplication].keyWindow.bounds;
            [[UIApplication sharedApplication].keyWindow addSubview:header];
        }
    };
    self.tableView.tableHeaderView=header;
    [self.view addSubview:self.tableView];
    
    if (_ISsearch==NO) {
        _hotView.hidden=NO;
        _tableView.hidden=YES;
        _collectionView.hidden=YES;
    }else{
        _hotView.hidden=YES;
        _tableView.hidden=YES;
        _collectionView.hidden=NO;
    }
    
    // Do any additional setup after loading the view from its nib.
}
-(void)creatView{
    
    NSArray *hotArr=[NSArray arrayWithObjects:@"致富",@"商城",@"助农",@"天下云粮",@"致富",@"商城",@"助农",@"天下云粮", nil];
    //热搜
    PWContentView *pwView = [[PWContentView alloc]initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH-20,450) dataArr:hotArr];
    //    pwView.backgroundColor = [UIColor orangeColor];
        [pwView btnClickBlock:^(NSInteger index) {
            [customSearchBar resignFirstResponder];
            _hotView.hidden=YES;
            _tableView.hidden=YES;
            _collectionView.hidden=NO;
            if (@available(iOS 13.0, *)) {
                UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CList"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeList:)];
                right.tintColor=[UIColor blackColor];
                self.navigationItem.rightBarButtonItem=right;
            } else {
                // Fallback on earlier versions
            }
        }];
    [_hotView addSubview:pwView];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/2, 254);
    layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 70);//头视图的大小

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(0, 15 ,0, 15);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Home_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    //注册头部视图
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([Menu_View class]) bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
}
-(void)searchView{
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 27+(Is_iPhoneX?28:0), SCREEN_WIDTH-100, 30)];
    customSearchBar.placeholder=@"请输入商品，品牌，店铺";
    customSearchBar.showsCancelButton = NO;
    customSearchBar.delegate=self;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
    
    
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(searchClick)];
        right.tintColor=[UIColor blackColor];
        self.navigationItem.rightBarButtonItem=right;
    } else {
        // Fallback on earlier versions
    }
}
-(void)searchClick{
    [customSearchBar resignFirstResponder];
    _hotView.hidden=YES;
    _tableView.hidden=YES;
    _collectionView.hidden=NO;
    isList=NO;
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CList"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeList:)];
        right.tintColor=[UIColor blackColor];
        self.navigationItem.rightBarButtonItem=right;
    } else {
        // Fallback on earlier versions
    }
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT);
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
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
#pragma  mark - 切换显示
-(void)ChangeList:(UIBarButtonItem *)item{
    [customSearchBar resignFirstResponder];
    _hotView.hidden=YES;
    if (!isList) {
        item.image=[UIImage imageNamed:@"List"];
        isList=YES;
        _tableView.hidden=NO;
        _collectionView.hidden=YES;
    }else{
        item.image=[UIImage imageNamed:@"CList"];
        isList=NO;
        _tableView.hidden=YES;
        _collectionView.hidden=NO;
    }
}
#pragma mark - 列表
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellIdentifier = @"cell";
    Search_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"Search_Cell" owner:self options:nil].firstObject;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodDetail_Con *detail=[[GoodDetail_Con alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark -collectionview 数据源方法
#pragma mark - 头部或者尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    if (kind == UICollectionElementKindSectionHeader) {
        Menu_View *headerRV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
        [headerRV setView:sort];
        headerRV.MenuBlock = ^(NSInteger type) {
            DLog(@"%ld",type);
            if (type==40) {
                Filtrate_View *header = [[[NSBundle mainBundle]loadNibNamed:@"Filtrate_View" owner:nil options:nil]lastObject];
                header.frame=[UIApplication sharedApplication].keyWindow.bounds;
                [[UIApplication sharedApplication].keyWindow addSubview:header];
            }
        };
        return headerRV;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Home_Cell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodDetail_Con *detail=[[GoodDetail_Con alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{

    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self searchView];

}
-(void)viewWillDisappear:(BOOL)animated{
    [customSearchBar removeFromSuperview];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    isList=NO;
    _hotView.hidden=NO;
    _tableView.hidden=YES;
    _collectionView.hidden=YES;
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(searchClick)];
        right.tintColor=[UIColor blackColor];
        self.navigationItem.rightBarButtonItem=right;
    } else {
        // Fallback on earlier versions
    }
    return YES;
}
//搜索按钮点击的回调
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _hotView.hidden=YES;
    _tableView.hidden=YES;
    _collectionView.hidden=NO;
    [customSearchBar resignFirstResponder];
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CList"] style:UIBarButtonItemStyleDone target:self action:@selector(ChangeList:)];
        right.tintColor=[UIColor blackColor];
        self.navigationItem.rightBarButtonItem=right;
    } else {
        // Fallback on earlier versions
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
