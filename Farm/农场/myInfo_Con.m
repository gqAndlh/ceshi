//
//  myInfo_Con.m
//  Farm
//
//  Created by mac on 2020/12/10.
//

#import "myInfo_Con.h"
#import "myInfo_Cell.h"

@interface myInfo_Con ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *flBtn;
@property (weak, nonatomic) IBOutlet UIButton *zzBtn;
@property (weak, nonatomic) IBOutlet UIButton *landBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UILabel *allLab;
@property (weak, nonatomic) IBOutlet UILabel *useLab;
@property (weak, nonatomic) IBOutlet UILabel *allNum;
@property (weak, nonatomic) IBOutlet UILabel *useNum;
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@property (nonatomic)NSInteger type;

@end

@implementation myInfo_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    _dataArray=[NSMutableArray array];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;

        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-80)/3, 150);

        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(20, 20 ,20, 20);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_infoView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetMaxY(_infoView.frame)) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    [self.view addSubview:_collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"myInfo_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)menuClick:(UIButton *)sender {
    _type=sender.tag;
    for (UIView *v in _topView.subviews) {
        if ([v isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)v;
            if (btn.tag==sender.tag) {
                btn.selected=NO;
            }else{
                btn.selected=YES;
            }
        }
    }
    CGRect LF = _line.frame;
    LF.origin.x=sender.center.x-10;
    if (sender.tag==0) {
        _collectionView.hidden=NO;
    }else{
        _collectionView.hidden=YES;
    }
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
//    for (UIView *v in _topView.subviews) {
//        if ([v isKindOfClass:[UIButton class]]) {
//            UIButton *btn=(UIButton *)v;
//            if (btn.tag==sender.tag) {
//                btn.titleLabel.textColor=[UIColor blackColor];
//            }else{
//                btn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//            }
//        }
//    }
//    if (sender.tag==0) {
//    _flBtn.titleLabel.textColor=[UIColor blackColor];
//    _zzBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//    _landBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//    }else if (sender.tag==1){
//        _flBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//        _zzBtn.titleLabel.textColor=[UIColor blackColor];
//        _landBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//    }else if (sender.tag==2){
//        _flBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//        _zzBtn.titleLabel.textColor=[PubLic_Class colorWithHexString:@"#999999"];
//        _landBtn.titleLabel.textColor=[UIColor blackColor];
//    }
    [self bindData:_type];
}
-(void)bindData:(NSInteger)type{
    if (type==0) {
        _allLab.text=@"总计(袋)";
        _useLab.text=@"使用中(袋)";
        _allNum.text=@"0";
        _useNum.text=@"0";
    }else if (type==1){
        _allLab.text=@"总计(粒)";
        _useLab.text=@"已种植(粒)";
        _allNum.text=@"0";
        _useNum.text=@"0";
    }else if (type==2){
        _allLab.text=@"总计(块)";
        _useLab.text=@"已种植(块)";
        _allNum.text=@"0";
        _useNum.text=@"0";
    }
}
#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    myInfo_Cell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    return cell;
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
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
