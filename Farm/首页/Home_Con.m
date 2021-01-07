//
//  Home_Con.m
//  Farm
//
//  Created by mac on 2020/12/15.
//

#import "Home_Con.h"
#import "Home_Cell.h"
#import "HomeHead_View.h"
#import "Search_Con.h"
#import "GoodDetail_Con.h"
#import "Vip_Con.h"
#import "ShopNotice_Con.h"
#import "ShopStreet_Con.h"
#import "BrandStreet_Con.h"
#import "Mess_Con.h"

@interface Home_Con ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    UISearchBar *customSearchBar;
}
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@property (nonatomic)NSInteger type;
@end

@implementation Home_Con

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title=@"首页";
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArray=[NSMutableArray array];
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)searchView{
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 27+(Is_iPhoneX?28:0), SCREEN_WIDTH-80, 30)];
    customSearchBar.placeholder=@"请输入商品，品牌，店铺";
    customSearchBar.showsCancelButton = NO;
    customSearchBar.delegate=self;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
    
    if (@available(iOS 13.0, *)) {
        UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithImage:[UIImage systemImageNamed:@"bell"] style:UIBarButtonItemStylePlain target:self action:@selector(Mess)];
        right.tintColor=[UIColor blackColor];
        self.navigationItem.rightBarButtonItem=right;
    } else {
        // Fallback on earlier versions
    }
    
}
-(void)Mess{
    DLog(@"消息");
    Mess_Con *mess=[[Mess_Con alloc]init];
    mess.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:mess animated:YES];
}
-(void)searchClick{
    DLog(@"搜索");
    Search_Con *search=[[Search_Con alloc]init];
    search.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:search animated:YES];
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    Search_Con *search=[[Search_Con alloc]init];
    search.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:search animated:YES];
    return NO;
}
-(void)creatView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/2, 254);

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(0, 15 ,0, 15);
        layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 250);//头视图的大小
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-TABBARHEIGHT) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Home_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    //注册头部视图
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeHead_View class]) bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
}
#pragma mark - 头部或者尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    if (kind == UICollectionElementKindSectionHeader) {
        HomeHead_View *headerRV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
        [headerRV creatView];
        headerRV.MenuBlock = ^(NSInteger type) {
            if (type==10) {
                ShopStreet_Con *street=[[ShopStreet_Con alloc]init];
                street.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:street animated:YES];
            }else if (type==20){
                ShopDetail_Con *shop=[[ShopDetail_Con alloc]init];
                shop.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:shop animated:YES];
            }else if (type==30){
                BrandStreet_Con *brand=[[BrandStreet_Con alloc]init];
                brand.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:brand animated:YES];
            }else if (type==40){
                Vip_Con *vip=[[Vip_Con alloc]init];
                vip.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:vip animated:YES];
            }else if (type==50){
                ShopNotice_Con *not=[[ShopNotice_Con alloc]init];
                not.hidesBottomBarWhenPushed=YES;
                [self.navigationController pushViewController:not animated:YES];
            }
        };
        return headerRV;
    }
    return nil;
}

#pragma mark -collectionview 数据源方法
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
    [self searchView];
}

-(void)viewWillDisappear:(BOOL)animated{
    [customSearchBar removeFromSuperview];
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
