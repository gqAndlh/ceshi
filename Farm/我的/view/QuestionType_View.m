//
//  QuestionType_View.m
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import "QuestionType_View.h"
#import "QuestionType_Cell.h"

@implementation QuestionType_View

-(void)creatView{
    _index=0;
    if (_type==0) {
        _title.text=@"反馈问题类型";
        _dataArray=[NSMutableArray arrayWithObjects:@"功能异常",@"体验问题",@"新功能建议",@"其他", nil];
    }else if (_type==1){
        _title.text=@"举报类型";
        _dataArray=[NSMutableArray arrayWithObjects:@"全部",@"等待处理",@"无效举报",@"有效举报",@"恶意举报", nil];
    }else if (_type==2){
        _title.text=@"选择银行";
        _dataArray=[NSMutableArray arrayWithObjects:@"人民银行",@"工商银行",@"农业银行",@"建设银行",@"交通银行",@"北京银行",@"农商银行",@"晋商银行", nil];
    }else if (_type==3){
        _title.text=@"咨询类型";
        _dataArray=[NSMutableArray arrayWithObjects:@"商品咨询",@"库存配送",@"支付",@"发票保修", nil];
    }else if (_type==4){
        _title.text=@"支付方式";
        _dataArray=[NSMutableArray arrayWithObjects:@"微信支付",@"云豆支付", nil];
    }else if (_type==5){
        _title.text=@"快递方式";
        _dataArray=[NSMutableArray arrayWithObjects:@"快递运输",@"空运",@"海运", nil];
    }
    [self.contentView addSubview:self.tableView];
}
-(UITableView*)tableView{
    
    if (_tableView==nil) {
        CGRect frame =CGRectMake(0, 0, SCREEN_WIDTH-30, CGRectGetHeight(_contentView.frame));
        _tableView=[[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
//        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator=NO;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.tableFooterView=[UIView new];
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
    QuestionType_Cell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
         cell =  [[NSBundle mainBundle]loadNibNamed:@"QuestionType_Cell" owner:self options:nil].firstObject;
    }
    cell.text.hidden=YES;
    cell.textLabel.text=_dataArray[indexPath.row];
    if (indexPath.row==_index) {
        cell.chooseBtn.selected=YES;
    }else{
        cell.chooseBtn.selected=NO;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _index=indexPath.row;
    [_tableView reloadData];
}
- (IBAction)cancelClick:(UIButton *)sender {
    [self removeFromSuperview];
}
- (IBAction)sureClick:(UIButton *)sender {
    [self removeFromSuperview];
    self.QuestionBlock(_dataArray[_index]);
}
-(void)returnText:(QuestionBlock)block{
    self.QuestionBlock=block;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
