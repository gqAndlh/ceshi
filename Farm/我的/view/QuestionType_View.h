//
//  QuestionType_View.h
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^QuestionBlock)(NSString *showText);//给block重命名,方便调用
@interface QuestionType_View : UIView<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic)BOOL isQuestion;
@property(nonatomic)int type;//0 反馈  1举报  2账户 3咨询类型 4支付方式 5快递方式
@property(nonatomic)NSInteger index;
@property (nonatomic, copy) QuestionBlock QuestionBlock;//声明一个block属性

-(void)creatView;
- (void)returnText:(QuestionBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
