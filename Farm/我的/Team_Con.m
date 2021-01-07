//
//  Team_Con.m
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import "Team_Con.h"
#import "Team_Cell.h"
#import "TeamHead_View.h"

@interface Team_Con ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;

@end

@implementation Team_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的团队";
    _dataArray=[NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)creatView{
    TeamHead_View *head=[[[NSBundle mainBundle]loadNibNamed:@"TeamHead_View" owner:nil options:nil]lastObject];
    _tableView.tableHeaderView=head;
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT);
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
//        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
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
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    Team_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"Team_Cell" owner:self options:nil].firstObject;
    }
    return cell;
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
