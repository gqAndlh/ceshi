//
//  BeanCgold_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>
typedef void (^BeanBlock)(NSString *showText);//给block重命名,方便调用
NS_ASSUME_NONNULL_BEGIN

@interface BeanCgold_View : UIView
@property (nonatomic, copy) BeanBlock BeanBlock;//声明一个block属性
@property (weak, nonatomic) IBOutlet UIButton *canBtn;
@property (weak, nonatomic) IBOutlet UITextField *num;
-(void)creatView;
- (void)returnText:(BeanBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
