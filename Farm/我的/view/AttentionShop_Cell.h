//
//  AttentionShop_Cell.h
//  Farm
//
//  Created by mac on 2020/12/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^GoodBlock)(NSInteger index);//给block重命名,方便调用

@interface AttentionShop_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIButton *shopBtn;
@property (weak, nonatomic) IBOutlet UIView *startView;
@property (weak, nonatomic) IBOutlet UIView *shopView;

@property (nonatomic, copy) GoodBlock GoodBlock;//声明一个block属性

- (void)returnText:(GoodBlock)block;//加上后方便第A视图书写该block方法

@end

NS_ASSUME_NONNULL_END
