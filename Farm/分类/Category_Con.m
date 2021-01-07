//
//  Category_Con.m
//  Farm
//
//  Created by mac on 2020/12/15.
//

#import "Category_Con.h"
#import "Category_Cell.h"
#import "Search_Con.h"
#import "GoodDetail_Con.h"

@interface Category_Con ()<UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate>
{
    UISearchBar *customSearchBar;
}
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@property (nonatomic)NSInteger type;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@end

@implementation Category_Con

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title=@"分类";
    _dataArray=[NSMutableArray array];
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
-(void)searchView{
    customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 27+(Is_iPhoneX?28:0), SCREEN_WIDTH-40, 30)];
    customSearchBar.placeholder=@"请输入商品，品牌，店铺";
    customSearchBar.showsCancelButton = NO;
    customSearchBar.delegate=self;
    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
    [self.navigationController.view addSubview: customSearchBar];
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
- (IBAction)menuclick:(UIButton *)sender {
    _typeLab.text=sender.titleLabel.text;
    CGRect LF = _line.frame;
    LF.origin.y=sender.center.y-10;
    [UIView animateWithDuration:0.3 animations:^{
            _line.frame=LF;
    }];
    for (UIView *v in _menuView.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *btn=(UIButton *)v;
            if (btn.tag==sender.tag) {
                btn.backgroundColor=[UIColor whiteColor];
            }else{
                btn.backgroundColor=[UIColor groupTableViewBackgroundColor];
            }
        }
    }
}
-(void)creatView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-130)/3, 140*rate);

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(10, 10 ,0, 10);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, CGRectGetHeight(_typeLab.frame), SCREEN_WIDTH-100, SCREEN_HEIGHT-NAVHEIGHT-TABBARHEIGHT-CGRectGetHeight(_typeLab.frame)) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Category_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Category_Cell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Search_Con *search=[[Search_Con alloc]init];
    search.hidesBottomBarWhenPushed=YES;
    search.ISsearch=YES;
    [self.navigationController pushViewController:search animated:YES];
//    GoodDetail_Con *detail=[[GoodDetail_Con alloc]init];
//    detail.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:detail animated:YES];
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
