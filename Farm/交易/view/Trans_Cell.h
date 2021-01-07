//
//  Trans_Cell.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Trans_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *allNum;
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property (nonatomic)NSDictionary *dic;
@end

NS_ASSUME_NONNULL_END
