//
//  ShopMenuHead_View.h
//  Farm
//
//  Created by mac on 2020/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^MenuBlock)(NSInteger type);//给block重命名,方便调用
@interface ShopMenuHead_View : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *activeBtn;
@property (weak, nonatomic) IBOutlet UIButton *numBtn;
@property (weak, nonatomic) IBOutlet UIButton *lvBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (nonatomic, copy) MenuBlock MenuBlock;//声明一个block属性
- (void)returnText:(MenuBlock)block;//加上后方便第A视图书写该block方法
-(void)setView:(int)num;
@end

NS_ASSUME_NONNULL_END
