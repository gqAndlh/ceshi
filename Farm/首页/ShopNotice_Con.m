//
//  ShopNotice_Con.m
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import "ShopNotice_Con.h"

@interface ShopNotice_Con ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property(nonatomic)UITableView *tableView;

@end

@implementation ShopNotice_Con

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"商城快讯";
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)typeClick:(UIButton *)sender {
    CGRect LF = _line.frame;
    LF.origin.x = sender.center.x-15;
    [UIView animateWithDuration:0.3 animations:^{
        _line.frame=LF;
    }];
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, CGRectGetMaxY(_topView.frame), SCREEN_WIDTH, SCREEN_HEIGHT-NAVHEIGHT- CGRectGetMaxY(_topView.frame));
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
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text=[NSString stringWithFormat:@"商品介绍%ld",indexPath.row];
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
