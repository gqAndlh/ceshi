//
//  Mess_Con.m
//  Farm
//
//  Created by mac on 2020/12/23.
//

#import "Mess_Con.h"
#import "Mess_Cell.h"
#import "MessDeatil_Con.h"

@interface Mess_Con ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIView *downView;

@end

@implementation Mess_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"消息";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetHeight(_downView.frame));
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
    Mess_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell =  [[[NSBundle mainBundle]loadNibNamed:@"Mess_Cell" owner:nil options:nil]lastObject];
    }

    cell.chooseBtn.tag=indexPath.row;
    cell.chooseBtn.selected=([_dataArray[indexPath.row] integerValue]==0)?NO:YES;
    [cell.chooseBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessDeatil_Con *detail=[[MessDeatil_Con alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}
//单选
-(void)chooseClick:(UIButton *)btn{
    if ([_dataArray[btn.tag] integerValue]==0) {
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(1)];
    }else{
        [_dataArray replaceObjectAtIndex:btn.tag withObject:@(0)];
    }
    [_tableView reloadData];
}

- (IBAction)allChoose:(UIButton *)sender {
    [_dataArray removeAllObjects];
    if (sender.selected) {
        sender.selected=NO;
    }else{
        sender.selected=YES;
    }
    for (int i= 0 ; i<20; i++) {
        [_dataArray addObject:(sender.selected)?@(1):@(0)];
    }
    [_tableView reloadData];
}
- (IBAction)delClick:(UIButton *)sender {
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定删除吗？"
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

#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<20; i++) {
        [_dataArray addObject:@(0)];
    }
    [_tableView reloadData];
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
