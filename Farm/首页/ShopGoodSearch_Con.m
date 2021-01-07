//
//  ShopGoodSearch_Con.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "ShopGoodSearch_Con.h"
#import "Home_Cell.h"
#import "ShopMenuHead_View.h"


@interface ShopGoodSearch_Con ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    UISearchBar *customSearchBar;
    int sort;
}
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UIView *hotView;

@end

@implementation ShopGoodSearch_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    sort=1;
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
-(void)searchView{
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(40, 27+(Is_iPhoneX?28:0), SCREEN_WIDTH-60, 30)];
    customSearchBar.placeholder=@"按关键字搜索本店商品";
    customSearchBar.showsCancelButton = NO;
    customSearchBar.delegate=self;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
    
//    if (@available(iOS 13.0, *)) {
//        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"bell"] style:UIBarButtonItemStylePlain target:self action:@selector(Mess)];
//        right.tintColor=[UIColor blackColor];
//        self.navigationItem.rightBarButtonItem=right;
//    } else {
//        // Fallback on earlier versions
//    }
    
}
-(void)creatView{
    
    NSArray *hotArr=[NSArray arrayWithObjects:@"致富",@"商城",@"助农",@"天下云粮",@"致富",@"商城",@"助农",@"天下云粮", nil];
    //热搜
    PWContentView *pwView = [[PWContentView alloc]initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH-20,450) dataArr:hotArr];
    //    pwView.backgroundColor = [UIColor orangeColor];
        [pwView btnClickBlock:^(NSInteger index) {
            [customSearchBar resignFirstResponder];
            _hotView.hidden=YES;
            _collectionView.hidden=NO;
        }];
    [_hotView addSubview:pwView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/2, 254);

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(0, 15 ,0, 15);
        layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 45);//头视图的大小
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Home_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ShopMenuHead_View class]) bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"menu"];
    //注册头部视图
}
#pragma mark - 头部或者尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    if (kind == UICollectionElementKindSectionHeader) {
        ShopMenuHead_View *headerRV = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"menu" forIndexPath:indexPath];
        [headerRV setView:sort];
        headerRV.MenuBlock = ^(NSInteger type) {
            sort=(int)type;
        };
        return  headerRV;
        }
    return nil;
}
#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
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

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    _hotView.hidden=NO;
    _collectionView.hidden=YES;
    return YES;
}
//搜索按钮点击的回调
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    _hotView.hidden=YES;
    _collectionView.hidden=NO;
    [customSearchBar resignFirstResponder];
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:nil];
    [self searchView];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [customSearchBar removeFromSuperview];
    [self.navigationController setNavigationBarHidden:YES animated:nil];
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
