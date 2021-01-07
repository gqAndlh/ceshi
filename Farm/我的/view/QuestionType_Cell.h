//
//  QuestionType_Cell.h
//  Farm
//
//  Created by mac on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionType_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;

@end

NS_ASSUME_NONNULL_END
