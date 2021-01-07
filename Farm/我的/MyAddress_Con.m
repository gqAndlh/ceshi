//
//  MyAddress_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "MyAddress_Con.h"
#import "MyAddress_Cell.h"
#import "EditAddress_Con.h"


@interface MyAddress_Con ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation MyAddress_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的地址";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
//    CGRect AF = _addBtn.frame;
//    AF.origin.y = SCREEN_HEIGHT-NAVHEIGHT-200;
//    _addBtn.frame=AF;
    // Do any additional setup after loading the view from its nib.
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-80);
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
    MyAddress_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"MyAddress_Cell" owner:self options:nil].firstObject;
    }
    if ([_dataArray[indexPath.row] intValue]==1) {
        cell.chooseBtn.selected=YES;
    }
    cell.editBtn.tag=indexPath.row;
    cell.delBtn.tag=indexPath.row;
    cell.chooseBtn.tag=indexPath.row;
    
    [cell.editBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.delBtn addTarget:self action:@selector(delClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.chooseBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_con isKindOfClass:[SureOrder_Con class]]) {
        _con.haveAddress=YES;
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark - 设置默认
-(void)chooseClick:(UIButton *)btn{
    
    for (int i = 0; i<_dataArray.count; i++) {
        if (btn.tag==i) {
            [_dataArray replaceObjectAtIndex:i withObject:@(1)];
        }else{
            [_dataArray replaceObjectAtIndex:i withObject:@(0)];
        }
    }
    [_tableView reloadData];
}
#pragma mark - 编辑
-(void)editClick:(UIButton *)btn{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"id"];
    EditAddress_Con *edit=[EditAddress_Con  new];
    edit.dic=dic;
    edit.title=@"修改收货地址";
    [self.navigationController pushViewController:edit animated:YES];
    
}
#pragma mark - 删除
-(void)delClick:(UIButton *)btn{
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
- (IBAction)addClick:(id)sender {
    EditAddress_Con *edit=[EditAddress_Con  new];
    edit.title=@"新增收货地址";
    [self.navigationController pushViewController:edit animated:YES];
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
