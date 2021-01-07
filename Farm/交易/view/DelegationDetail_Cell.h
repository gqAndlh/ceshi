//
//  DelegationDetail_Cell.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DelegationDetail_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIButton *cancleBtn;
@property (weak, nonatomic) IBOutlet UILabel *finishLab;
@property (weak, nonatomic) IBOutlet UILabel *cancleLab;
@property (nonatomic)int type;
@property (nonatomic)NSDictionary *dic;
@end

NS_ASSUME_NONNULL_END
