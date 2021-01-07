//
//  MyDrawAcc_Cell.h
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyDrawAcc_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *cardNum;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

NS_ASSUME_NONNULL_END
