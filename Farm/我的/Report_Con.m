//
//  Report_Con.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "Report_Con.h"
#import "QuestionType_View.h"
#import "Report_Cell.h"
#import "ReportDetail_Con.h"

@interface Report_Con ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *topView;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property (weak, nonatomic) IBOutlet UIButton *type;

@end

@implementation Report_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"违规举报";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self requestData];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeClick:(UIButton *)sender {
    QuestionType_View *question=[[[NSBundle mainBundle]loadNibNamed:@"QuestionType_View" owner:nil options:nil]lastObject];
    question.frame=[UIApplication sharedApplication].keyWindow.bounds;
    question.type=1;
    [question creatView];
    question.QuestionBlock = ^(NSString * _Nonnull showText) {
    [_type setTitle:[NSString stringWithFormat:@"%@ >",showText] forState:0];
    };
    [[UIApplication sharedApplication].keyWindow addSubview:question];
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetHeight(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT-CGRectGetHeight(_topView.frame));
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
    Report_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[[NSBundle mainBundle]loadNibNamed:@"Report_Cell" owner:nil options:nil]lastObject];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ReportDetail_Con *detail=[[ReportDetail_Con alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark - 获取数据
-(void)requestData{
    for (int i= 0 ; i<10; i++) {
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
