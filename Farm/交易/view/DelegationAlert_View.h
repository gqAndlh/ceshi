//
//  DelegationAlert_View.h
//  Farm
//
//  Created by mac on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^alertBlock)(NSString *showText);//给block重命名,方便调用
@interface DelegationAlert_View : UIView
@property (nonatomic, copy) alertBlock alertBlock;//声明一个block属性
@property (weak, nonatomic) IBOutlet UIButton *canBtn;
-(void)creatView;
- (void)returnText:(alertBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
