//
//  MyAddress_Cell.h
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyAddress_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameAphone;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;


@end

NS_ASSUME_NONNULL_END
