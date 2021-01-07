//
//  ShopDetail_Con.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "ShopDetail_Con.h"
#import "Home_Cell.h"
#import "ShopHomeHead_View.h"
#import "GoodDetail_Con.h"
#import "ShopIntroduce_Con.h"
#import "ShopMenuHead_View.h"
#import "ShopGoodSearch_Con.h"

@interface ShopDetail_Con ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>
{
    NSInteger type;
    int sort;
}
@property (weak, nonatomic) IBOutlet UITextField *searchView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@end

@implementation ShopDetail_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchView.delegate=self;
    CGRect TF = _topView.frame;
    TF.size.height=TF.size.height+(Is_iPhoneX?20:0);
    _topView.frame=TF;
    sort=11;
    [self creatView];
    // Do any additional setup after loading the view.
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
        layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 45);//头视图的大小
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-CGRectGetHeight(_topView.frame)) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Home_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    //注册头部视图
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ShopHomeHead_View class]) bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ShopMenuHead_View class]) bundle:nil]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"menu"];
}
#pragma mark - 头部或者尾部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //如果是头部视图 (因为这里的kind 有头部和尾部所以需要判断  默认是头部,严谨判断比较好)
    if (kind == UICollectionElementKindSectionHeader) {
        if (type==0) {
            ShopHomeHead_View *headerRV = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
            return headerRV;
        }else{
            ShopMenuHead_View *headerRV = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"menu" forIndexPath:indexPath];
            [headerRV setView:sort];
            headerRV.MenuBlock = ^(NSInteger type) {
                sort=(int)type;
            };
            return headerRV;
        }
        
    }
    return nil;
}

#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return (type==0)?4:1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 5;
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

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self.navigationController setNavigationBarHidden:NO animated:nil];
    ShopGoodSearch_Con *search=[[ShopGoodSearch_Con alloc]init];
    [self.navigationController pushViewController:search animated:YES];
    return NO;
}

- (IBAction)typeClick:(UIButton *)sender {
    CGRect LF = _line.frame;
    LF.origin.x=sender.center.x-15;
    [UIView animateWithDuration:0.3 animations:^{
            _line.frame=LF;
    }];
    DLog(@"%ld",sender.tag);
    type=sender.tag;
    [_collectionView reloadData];
    
}
- (IBAction)backClick:(UIButton *)sender {
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)collestclick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
    }
}
- (IBAction)IntroduceClick:(UIButton *)sender {
    ShopIntroduce_Con *shop=[[ShopIntroduce_Con alloc]init];
    [self.navigationController pushViewController:shop animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    _searchView.hidden=NO;
    [self.navigationController setNavigationBarHidden:YES animated:nil];

}
-(void)viewWillDisappear:(BOOL)animated{
    _searchView.hidden=YES;
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
