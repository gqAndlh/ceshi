//
//  DelegationTrans_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^delegateBlock)(NSString *showText);//给block重命名,方便调用
@interface DelegationTrans_View : UIView

@property (weak, nonatomic) IBOutlet UILabel *fee;
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UILabel *maxNum;
@property (nonatomic, copy) delegateBlock delegateBlock;//声明一个block属性
-(void)creatView;
- (void)returnText:(delegateBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
