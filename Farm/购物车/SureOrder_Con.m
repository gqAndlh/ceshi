//
//  SureOrder_Con.m
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import "SureOrder_Con.h"
#import "SureOrder_Cell.h"
#import "ShowAddress_View.h"
#import "MyAddress_Con.h"
#import "PayMode_View.h"
#import "QuestionType_View.h"
#import "SureOrderFoot_View.h"

@interface SureOrder_Con ()<UITableViewDelegate,UITableViewDataSource>
{
    ShowAddress_View *address;
    PayMode_View *payMode;
}
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIView *downView;

@end

@implementation SureOrder_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"确认订单";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
    address=[[[NSBundle mainBundle]loadNibNamed:@"ShowAddress_View" owner:nil options:nil]lastObject];
    address.addBlock = ^(NSString * _Nonnull showText) {
        MyAddress_Con *address=[[MyAddress_Con alloc]init];
        address.con=self;
        [self.navigationController pushViewController:address animated:YES];
    };
    self.tableView.tableHeaderView=address;
    
    payMode=[[[NSBundle mainBundle]loadNibNamed:@"PayMode_View" owner:nil options:nil]lastObject];
    payMode.PayBlock = ^(NSString * _Nonnull showText) {
        QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
        question.frame=[UIApplication sharedApplication].keyWindow.bounds;
        question.type=4;
        [question creatView];
        question.QuestionBlock = ^(NSString * _Nonnull showText) {
            payMode.payLab.text=showText;
        };
        [[UIApplication sharedApplication].keyWindow addSubview:question];
    };
    self.tableView.tableFooterView=payMode;
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetHeight(_downView.frame));
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
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView *head=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    
    UIImageView *shopImg=[[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
//    shopImg.backgroundColor=[UIColor greenColor];
    [shopImg setImage:[UIImage imageNamed:@"blackShop"]];
    [head addSubview:shopImg];
    UILabel *shopName=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(shopImg.frame)+10, 0, SCREEN_WIDTH-200, 50)];
    shopName.text=[NSString stringWithFormat:@"店铺%@",@"名称"];
    shopName.textColor=[UIColor blackColor];
    shopName.textAlignment=NSTextAlignmentLeft;
    [head addSubview:shopName];
    return head;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 145;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SureOrderFoot_View *foot=[[[NSBundle mainBundle]loadNibNamed:@"SureOrderFoot_View" owner:nil options:nil]lastObject];
    foot.expressMode.tag=section;
    [foot.expressMode addTarget:self action:@selector(modeClick:) forControlEvents:UIControlEventTouchUpInside];
    return foot;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
    SureOrder_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"SureOrder_Cell" owner:self options:nil].firstObject;
    }
    
    return cell;

}
-(void)modeClick:(UIButton *)btn{
    QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
    question.frame=[UIApplication sharedApplication].keyWindow.bounds;
    question.type=5;
    [question creatView];
    question.QuestionBlock = ^(NSString * _Nonnull showText) {
        [btn setTitle:showText forState:0];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:question];
}
#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<2; i++) {
        [_dataArray addObject:@(0)];
    }
    [_tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    if (_haveAddress) {
        address.addressView.hidden=NO;
        address.addressBtn.hidden=YES;
        [address creatView];
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
