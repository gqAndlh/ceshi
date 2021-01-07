//
//  MyOrder_Cell.h
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyOrder_Cell : UITableViewCell
@property(nonatomic)NSInteger state;
@property(nonatomic)BOOL ISsell;
@property(nonatomic)NSDictionary *dic;
@property (weak, nonatomic) IBOutlet UILabel *stateLab;
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

NS_ASSUME_NONNULL_END
