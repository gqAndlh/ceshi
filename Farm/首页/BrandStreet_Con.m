//
//  BrandStreet_Con.m
//  Farm
//
//  Created by mac on 2020/12/23.
//

#import "BrandStreet_Con.h"
#import "Category_Cell.h"

@interface BrandStreet_Con ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;

@end

@implementation BrandStreet_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"品牌街";
    _dataArray=[NSMutableArray array];
    [self creatView];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeClick:(UIButton *)sender {
    CGRect LF = _line.frame;
    LF.origin.x = sender.center.x-15;
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
}
-(void)creatView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-30)/3, (SCREEN_WIDTH-30)/3+40);

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(10, 10 ,10, 10);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetHeight(_topView.frame)) collectionViewLayout:layout];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
