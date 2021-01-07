//
//  ShopCar_Cell.h
//  Farm
//
//  Created by mac on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShopCar_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (nonatomic)NSDictionary *dic;
@end

NS_ASSUME_NONNULL_END
