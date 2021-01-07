//
//  GoodDetailHead_View.m
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import "GoodDetailHead_View.h"
#import "LikeGood_Cell.h"
#import "YCMenuView.h"

@implementation GoodDetailHead_View

- (IBAction)menuClick:(UIButton *)sender {
    YCMenuView *view = [YCMenuView menuWithActions:self.arr width:140 relyonView:sender];
    [view show];
}
#pragma mark - 返回
- (IBAction)backClick:(id)sender {
    self.GoodBlock(@"100");
}
#pragma mark - 收藏
- (IBAction)LikeClick:(UIButton *)sender {
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
    }
}
- (IBAction)allClick:(UIButton *)sender {
    self.GoodBlock(@"200");
}
- (IBAction)pushShop:(UIButton *)sender {
    self.GoodBlock(@"300");
}
- (IBAction)commentClick:(UIButton *)sender {
    self.GoodBlock(@"400");
}
- (IBAction)payReferClick:(id)sender {
    self.GoodBlock(@"500");
}
-(void)banner:(NSMutableArray *)pics{
    NSArray *picArr=[NSArray arrayWithObjects:@"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=384578138,2985306574&fm=26&gp=0.jpg",@"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=323600945,481798035&fm=26&gp=0.jpg",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.wndhw.com%2Ffengjing%2Fshanshui%2Fimages%2Fss010t8.jpg&refer=http%3A%2F%2Fwww.wndhw.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611550262&t=804c65ee4dd229db59afc0a4011d35fc",@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.sucai.biz%2F170303%2F1-1F303231U4.jpg&refer=http%3A%2F%2Fimg.sucai.biz&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611550262&t=56b8e0ab25001cbf490c7e472e02d4e7", nil];
    JGCycleCollectionView *cycle = [[JGCycleCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250)];
    cycle.data = picArr;
    cycle.autoPage = YES;
    [self addSubview:cycle];
//    [self insertSubview:cycle aboveSubview:_topView];
    cycle.URLBlock = ^(NSString* url) {
        
    };
}

-(void)menuView{
    UIImage *image = [UIImage imageNamed:@"blackShop"];
    // Do any additional setup after loading the view.
    YCMenuAction *action = [YCMenuAction actionWithTitle:@"首页" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
        self.GoodBlock(@"700");
    }];
    YCMenuAction *action1 = [YCMenuAction actionWithTitle:@"分类" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
        self.GoodBlock(@"800");
    }];
    YCMenuAction *action2 = [YCMenuAction actionWithTitle:@"购物车" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
        self.GoodBlock(@"900");
    }];
    YCMenuAction *action3 = [YCMenuAction actionWithTitle:@"关注" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
        self.GoodBlock(@"1000");
    }];
    YCMenuAction *action4 = [YCMenuAction actionWithTitle:@"举报" image:image handler:^(YCMenuAction *action) {
        NSLog(@"点击了%@",action.title);
        self.GoodBlock(@"600");
    }];
    
    self.arr = [NSMutableArray arrayWithObjects:action,action1,action2,action3,action4, nil];
}

-(void)creatView{
    [self banner:nil];
    [self menuView];
    
    _allGoodBtn.layer.borderWidth=1;
    _allGoodBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"￥28.00 ￥24.00"
    attributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleNone)}];
    
    [attrStr setAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),
    NSBaselineOffsetAttributeName : @0} range:NSMakeRange(attrStr.length-6, 6)];
    [attrStr addAttribute:NSFontAttributeName
    value:[UIFont systemFontOfSize:11.0]
    range:NSMakeRange(attrStr.length-6, 6)];
    [attrStr addAttribute:NSForegroundColorAttributeName
    value:[UIColor grayColor]
    range:NSMakeRange(attrStr.length-6, 6)];
    _price.attributedText = attrStr;
    
    CGRect TF = _topView.frame;
    TF.size.height=NAVHEIGHT;
    _topView.frame=TF;
    [self bringSubviewToFront:_topView];
    //底部视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/3, 175);
        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(10, 10 ,0, 10);
//        layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 250);//头视图的大小
    int a = 3;
    int h = 185*(a%3==0?a/3:a/3+1);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_LikeLab.frame)+10, SCREEN_WIDTH,h ) collectionViewLayout:layout];
    _collectionView.scrollEnabled=NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"LikeGood_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:_collectionView];
    
    CGRect SF = self.frame;
    SF.size.height=CGRectGetMaxY(self.collectionView.frame)+10;
    self.frame=SF;
}
#pragma mark - 底部商品
#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LikeGood_Cell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DLog(@"%ld",indexPath.row);
}

-(void)returnText:(GoodBlock)block{
    self.GoodBlock=block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
