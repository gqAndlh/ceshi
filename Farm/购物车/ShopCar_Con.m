//
//  ShopCar_Con.m
//  Farm
//
//  Created by mac on 2020/12/15.
//

#import "ShopCar_Con.h"
#import "ShopCar_Cell.h"
#import "Home_Cell.h"
#import "ShopCarHead_View.h"
#import "SureOrder_Con.h"

@interface ShopCar_Con ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArrayC;

@property (weak, nonatomic) IBOutlet UIView *downView;
@property (weak, nonatomic) IBOutlet UILabel *allPrice;
@property (weak, nonatomic) IBOutlet UIButton *allBtn;
@property (weak, nonatomic) IBOutlet UIButton *attentionBtn;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;


@property(nonatomic)UIBarButtonItem *editItem;
@property(nonatomic)NSMutableArray *testArr;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation ShopCar_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"购物车";
    _delBtn.layer.borderWidth=1;
    _delBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    _attentionBtn.layer.borderWidth=1;
    _attentionBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    _editItem=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editClick:)];
    _editItem.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=_editItem;
    
    _testArr=[[NSMutableArray alloc]init];
    [self.view addSubview:self.tableView];
    [self testData];
    CGRect DF = _downView.frame;
    DF.origin.y=CGRectGetMaxY(_tableView.frame);
    _downView.frame=DF;
    
    ShopCarHead_View *head =[[[NSBundle mainBundle]loadNibNamed:@"ShopCarHead_View" owner:nil options:nil]lastObject];
    head.shopBlock = ^(NSString * _Nonnull showText) {
        if ([showText intValue]==0) {
            self.tabBarController.selectedIndex=0;
        }else{
            
        }
    };
    _tableView.tableHeaderView=head;
    
    //底部视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];

        // 设置item的行间距和列间距
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;
        // 设置item的大小
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-40)/2, 254);
        // 设置每个分区的 上左下右 的内边距
        layout.sectionInset = UIEdgeInsetsMake(0, 15 ,0, 15);
//        layout.headerReferenceSize=CGSizeMake(SCREEN_WIDTH, 250);//头视图的大小
    int a = 21;
    int h = 265*(a%2==0?a/2:a/2+1);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,h ) collectionViewLayout:layout];
    _collectionView.scrollEnabled=NO;
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView.showsVerticalScrollIndicator = NO;   //是否显示滚动条
    //3、添加到控制器的view
    _tableView.tableFooterView=_collectionView;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"Home_Cell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-TABBARHEIGHT-CGRectGetHeight(_downView.frame));
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
-(void)editClick:(UIBarButtonItem *)item{
    if ([item.title isEqualToString:@"编辑"]) {
        item.title=@"完成";
        _delBtn.hidden=NO;
        _attentionBtn.hidden=NO;
        _payBtn.hidden=YES;
        _allPrice.hidden=YES;
    }else{
        item.title=@"编辑";
        _delBtn.hidden=YES;
        _attentionBtn.hidden=YES;
        _payBtn.hidden=NO;
        _allPrice.hidden=NO;
    }
}
#pragma mark TableViewDelegate&DataSource
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return (section<_testArr.count)?50:0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
#pragma mark - 店铺点击
-(void)shopclick:(UIButton *)btn{
    DLog(@"%ld",btn.tag);
    ShopDetail_Con *detail=[[ShopDetail_Con alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    if (section<_testArr.count) {
        NSDictionary *dic=_testArr[section];
        NSArray *arr = dic[@"data"];
        UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    //    head.backgroundColor=[UIColor redColor];
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(6, 15, 20, 20)];
        [btn setImage:[UIImage imageNamed:@"No_Select"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"Select"] forState:UIControlStateSelected];
        btn.selected=[self returnState:arr];
        btn.tag=section;
        [btn addTarget:self action:@selector(shopBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [head addSubview:btn];
        
        UIImageView *shopImg=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame)+10, 15, 20, 20)];
//        shopImg.backgroundColor=[UIColor greenColor];
        [shopImg setImage:[UIImage imageNamed:@"blackShop"]];
        [head addSubview:shopImg];
        
        UIButton *shopName=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shopImg.frame)+10, 0, SCREEN_WIDTH-200, 50)];
        [shopName setTitle:[NSString stringWithFormat:@"店铺%@ >",dic[@"shopID"]] forState:0];
        shopName.tag=section;
        [shopName setTitleColor:[UIColor blackColor] forState:0];
        shopName.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        [shopName addTarget:self action:@selector(shopclick:) forControlEvents:UIControlEventTouchUpInside];
        [head addSubview:shopName];
        return head;
    }else{
        UILabel *foot=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        foot.backgroundColor=[UIColor groupTableViewBackgroundColor];
        foot.text=@"—— 为你推荐 ——";
        foot.font=MyFont(15);
        foot.textAlignment=NSTextAlignmentCenter;
        return foot;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section<_testArr.count) {
        NSArray *arr=_testArr[section][@"data"];
        UIView *foot=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        foot.backgroundColor=[UIColor groupTableViewBackgroundColor];
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        lab.textAlignment=NSTextAlignmentRight;
        lab.backgroundColor=[UIColor whiteColor];
        lab.text=[NSString stringWithFormat:@"共%ld件商品 计：%@%.2f   ",arr.count,@"￥",[self showShopPrice:arr]];
        [foot addSubview:lab];
        return foot;
    }else
        return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _testArr.count+1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section<_testArr.count) {
        NSArray *arr=_testArr[section][@"data"];
        return arr.count;
    }else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *arr=_testArr[indexPath.section][@"data"];
    NSDictionary *dic=arr[indexPath.row];
    NSString* cellIdentifier = @"cell";
    ShopCar_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"ShopCar_Cell" owner:self options:nil].firstObject;
    }
    cell.dic=dic;
    cell.chooseBtn.tag = indexPath.section*10000+indexPath.row;
    cell.subBtn.tag = indexPath.section*10000+indexPath.row;
    cell.addBtn.tag = indexPath.section*10000+indexPath.row;
    [cell.chooseBtn addTarget:self action:@selector(SelectClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.subBtn addTarget:self action:@selector(subClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.addBtn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodDetail_Con *detail=[[GoodDetail_Con alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodDetail_Con *detail=[[GoodDetail_Con alloc]init];
    detail.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - 底部商品
#pragma mark -collectionview 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;   //返回section数
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 21;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    Home_Cell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    return cell;
}

#pragma mark - 测试数据
-(void)testData{
    for (int i = 0; i < 5; i++) {
        NSMutableDictionary *dataDic=[NSMutableDictionary dictionary];
        NSMutableArray *data=[NSMutableArray array];
        [dataDic setObject:@(i) forKey:@"shopID"];
        for (int j = 0; j<2; j++) {
            NSMutableDictionary *dic=[NSMutableDictionary dictionary];
            [dic setValue:@(1) forKey:@"num"];
            [dic setValue:@(0) forKey:@"state"];
            [dic setValue:@(100) forKey:@"price"];
            [data addObject:dic];
        }
        [dataDic setObject:data forKey:@"data"];
        [_testArr addObject:dataDic];
    }
}
#pragma mark -//商品数量加减
-(void)subClick:(UIButton *)btn{
    NSInteger sec = btn.tag/10000;
    NSInteger row = btn.tag%10000;
    NSMutableDictionary * data = _testArr[sec];
    NSMutableArray *arr = data[@"data"];
    NSMutableDictionary *dic=arr[row];
    if ([dic[@"num"] intValue]>1) {
        int num = [dic[@"num"] intValue]-1;
        [dic setObject:@(num) forKey:@"num"];
    }
//    if (_allBtn.selected) {
        [self showAllPrice];
//    }else{
//        _allPrice.text=[NSString stringWithFormat:@"总计：￥0.00"];
//    }
    [_tableView reloadData];
}
-(void)addClick:(UIButton *)btn{
    NSInteger sec = btn.tag/10000;
    NSInteger row = btn.tag%10000;
    NSMutableDictionary * data = _testArr[sec];
    NSMutableArray *arr = data[@"data"];
    NSMutableDictionary *dic=arr[row];
    int num = [dic[@"num"] intValue]+1;
    [dic setObject:@(num) forKey:@"num"];
//    if (_allBtn.selected) {
        [self showAllPrice];
//    }else{
//        _allPrice.text=[NSString stringWithFormat:@"总计：￥0.00"];
//    }
    [_tableView reloadData];
}
#pragma mark -//店铺全选
-(void)shopBtnClick:(UIButton *)btn{
    NSMutableDictionary *dic=_testArr[btn.tag];
    NSMutableArray *arr = dic[@"data"];
    for (NSMutableDictionary *dic in arr) {
        if (btn.selected) {
            [dic setObject:@(0) forKey:@"state"];
        }else{
            [dic setObject:@(1) forKey:@"state"];
        }
    }
//    if (_allBtn.selected) {
        [self showAllPrice];
//    }else{
//        _allPrice.text=[NSString stringWithFormat:@"总计：￥0.00"];
//    }
    [_tableView reloadData];
}
#pragma mark -//商品单选
-(void)SelectClick:(UIButton *)btn{
    NSInteger sec = btn.tag/10000;
    NSInteger row = btn.tag%10000;
    NSMutableDictionary * data = _testArr[sec];
    NSMutableArray *arr = data[@"data"];
    NSMutableDictionary *dic=arr[row];
    if ([dic[@"state"] intValue]==0) {
        [dic setObject:@(1) forKey:@"state"];
    }else{
        [dic setObject:@(0) forKey:@"state"];
    }
//    if (_allBtn.selected) {
        [self showAllPrice];
//    }else{
//        _allPrice.text=[NSString stringWithFormat:@"总计：￥0.00"];
//    }
    [_tableView reloadData];
}
#pragma mark - //店铺全选显示
-(BOOL)returnState:(NSArray *)arr{
    for (NSDictionary *dic in arr) {
        if ([dic[@"state"] intValue]==0) {
            return NO;
        }
    }
    return YES;
}
#pragma mark - //购物车全选
- (IBAction)allSelectClick:(UIButton *)sender {
    for (NSMutableDictionary *dic in _testArr) {
        NSMutableArray *arr = dic[@"data"];
        for (NSMutableDictionary *data in arr) {
            if (sender.selected) {
                [data setObject:@(0) forKey:@"state"];
            }else{
                [data setObject:@(1) forKey:@"state"];
            }
        }
    }
    sender.selected = (sender.selected)?NO:YES;
    if (sender.selected) {
        [self showAllPrice];
    }else{
        _allPrice.text=[NSString stringWithFormat:@"总计：￥0.00"];
    }
    [_tableView reloadData];
}

#pragma mark - 计算购物车总价格
-(void)showAllPrice{
    double price;
    for (NSDictionary *dic in _testArr) {
        NSArray *arr=dic[@"data"];
        for (NSDictionary *data in arr) {
            if ([data[@"state"] intValue]!=0) {
                price = price + [data[@"price"] doubleValue]*[data[@"num"] intValue];
            }
        }
    }
    _allPrice.text=[NSString stringWithFormat:@"总计：%.2f",price];
}
#pragma mark - 计算店铺总价格
-(double)showShopPrice:(NSArray *)arr{
    double price;
    for (NSDictionary *data in arr) {
        price = price + [data[@"price"] doubleValue]*[data[@"num"] intValue];
    }
    return price;
}
#pragma mark - 结算
- (IBAction)calculateClick:(UIButton *)sender {
    SureOrder_Con *order=[[SureOrder_Con alloc]init];
    order.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:order animated:YES];
}
#pragma mark - 关注

- (IBAction)attentionClick:(UIButton *)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定要将选中商品移入我的关注吗？"
                                                                  message:nil
                                                           preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    [defaultAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
   UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}
#pragma mark - 删除

- (IBAction)delClick:(UIButton *)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定删除选中商品吗？"
                                                                  message:nil
                                                           preferredStyle:UIAlertControllerStyleAlert];
   
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    [defaultAction setValue:[UIColor redColor] forKey:@"titleTextColor"];
   UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
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
