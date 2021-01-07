//
//  DelegationDetail_Con.m
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import "DelegationDetail_Con.h"
#import "DelegationDetail_Cell.h"
#import "Cancel_View.h"


@interface DelegationDetail_Con ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *WTBtn;//委托中
@property (weak, nonatomic) IBOutlet UIButton *FinishBtn;//完成
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)UILabel*alertLab;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (nonatomic)NSInteger type;
@end

@implementation DelegationDetail_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"委托明细";
    [self.view addSubview:self.tableView];
    _dataArray=[NSMutableArray array];
    [self alertView];
//    [self requestData];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)menuClick:(UIButton *)sender {
    _type=sender.tag;
    CGRect LF = _line.frame;
    LF.origin.x=sender.center.x-10;
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
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
    if (_type==0) {
        _alertLab.text=@"您还没有任何委托～";
    }else if (_type==1){
        _alertLab.text=@"您还没有任何委托～";
    }else if (_type==2){
        _alertLab.text=@"您还没有任何委托撤单～";
    }
    [_tableView reloadData];
}
//无数据提示
-(void)alertView{
    CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetMaxY(_topView.frame));
    _alertLab=[[UILabel alloc]initWithFrame:frame];
    _alertLab.textAlignment=NSTextAlignmentCenter;
    _alertLab.textColor=[PubLic_Class colorWithHexString:@"#999999"];
    _alertLab.text=@"您还没有任何委托～";
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetMaxY(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetMaxY(_topView.frame));
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
#pragma mark TableViewDelegate&DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    DelegationDetail_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"DelegationDetail_Cell" owner:self options:nil].firstObject;
    }
    cell.type=_type;
    cell.dic=nil;
    cell.tag=indexPath.row;
    [cell.cancleBtn addTarget:self action:@selector(CancelClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(void)CancelClick:(UIButton *)btn{
    Cancel_View *Cancel=[[[NSBundle mainBundle]loadNibNamed:@"Cancel_View" owner:nil options:nil]lastObject];
    Cancel.frame=[UIApplication sharedApplication].keyWindow.bounds;
    [[UIApplication sharedApplication].keyWindow addSubview:Cancel];
    [Cancel creatView];
    Cancel.CancelBlock = ^(NSString * _Nonnull showText) {
        DLog(@"撤单");
    };
}
-(void)requestData{
    if (_dataArray.count==0) {
        self.tableView.tableFooterView=self.alertLab;
    }else{
        self.tableView.tableFooterView=nil;
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
