//
//  MyInvoice_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "MyInvoice_Con.h"
#import "EditInvoice_Con.h"
#import "Common_Cell.h"
#import "Dedicated_Cell.h"

@interface MyInvoice_Con ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

@implementation MyInvoice_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的发票";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
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
    if (indexPath.row%2==0) {
        NSString* cellIdentifier = @"cell";
        Common_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
             cell =  [[NSBundle mainBundle]loadNibNamed:@"Common_Cell" owner:self options:nil].firstObject;
        }
        cell.editBtn.tag=indexPath.row;
        cell.delBtn.tag=indexPath.row;
        [cell.editBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.delBtn addTarget:self action:@selector(delClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        NSString* cellIdentifier = @"cell";
        Dedicated_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
             cell =  [[NSBundle mainBundle]loadNibNamed:@"Dedicated_Cell" owner:self options:nil].firstObject;
        }
        cell.editBtn.tag=indexPath.row;
        cell.delBtn.tag=indexPath.row;
        [cell.editBtn addTarget:self action:@selector(editClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.delBtn addTarget:self action:@selector(delClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    
    
    return nil;
}

#pragma mark - 编辑
-(void)editClick:(UIButton *)btn{
    NSMutableDictionary *dic=[NSMutableDictionary dictionary];
    [dic setObject:@"1" forKey:@"id"];
    EditInvoice_Con *edit=[EditInvoice_Con  new];
    edit.dic=dic;
    edit.title=@"修改发票";
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
    EditInvoice_Con *edit=[EditInvoice_Con  new];
    edit.title=@"新增发票";
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
