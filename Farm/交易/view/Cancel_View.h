//
//  Cancel_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^CancelBlock)(NSString *showText);//给block重命名,方便调用
@interface Cancel_View : UIView
@property (nonatomic, copy) CancelBlock CancelBlock;//声明一个block属性
@property (weak, nonatomic) IBOutlet UIButton *canBtn;
-(void)creatView;
- (void)returnText:(CancelBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
