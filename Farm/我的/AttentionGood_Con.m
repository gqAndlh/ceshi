//
//  AttentionGood_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "AttentionGood_Con.h"
#import "AttentionGood_Cell.h"

@interface AttentionGood_Con ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isEdit;
}
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIView *downView;

@end

@implementation AttentionGood_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"关注商品";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self creatView];
    [self requestData];
    // Do any additional setup after loading the view.
}
-(void)creatView{
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editClick:)];
    right.tintColor=[UIColor blackColor];
    self.navigationItem.rightBarButtonItem=right;
}
-(void)editClick:(UIBarButtonItem *)item{
    CGRect TF = _tableView.frame;
    CGRect DF = _downView.frame;
    if (!isEdit) {
        item.title=@"完成";
        isEdit=YES;
        _downView.hidden=NO;
        TF.size.height=TF.size.height-DF.size.height;
        DF.origin.y=CGRectGetMaxY(_tableView.frame)-DF.size.height;
    }else{
        item.title=@"编辑";
        isEdit=NO;
        _downView.hidden=YES;
        TF.size.height=SCREEN_HEIGHT-NAVHEIGHT;
    }
    _tableView.frame=TF;
    _downView.frame=DF;
    [_tableView reloadData];
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT);
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    AttentionGood_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"AttentionGood_Cell" owner:self options:nil].firstObject;
    }
    if (!isEdit) {
        cell.chooseBtn.hidden=YES;
        CGRect CF = cell.infoView.frame;
        CF.origin.x=CGRectGetMidX(cell.chooseBtn.frame);
        cell.infoView.frame=CF;
    }
    if ([_dataArray[indexPath.row] intValue]==0) {
        cell.chooseBtn.selected=NO;
    }else{
        cell.chooseBtn.selected=YES;
    }
    cell.chooseBtn.tag=indexPath.row;
    [cell.chooseBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)chooseClick:(UIButton *)btn{
    if (btn.selected) {
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(0)];
    }else{
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(1)];
    }
    [_tableView reloadData];
}
#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<20; i++) {
        [_dataArray addObject:@(0)];
    }
    [_tableView reloadData];
}
- (IBAction)allChooseClick:(UIButton *)sender {
    [_dataArray removeAllObjects];
    if (sender.selected==NO) {
        sender.selected=YES;
        for (int i= 0 ; i<20; i++) {
            [_dataArray addObject:@(1)];
        }
    }else{
        sender.selected=NO;
        for (int i= 0 ; i<20; i++) {
            [_dataArray addObject:@(0)];
        }
    }
    [_tableView reloadData];
}
- (IBAction)cancelClick:(UIButton *)sender {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定要取消关注吗？"
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
