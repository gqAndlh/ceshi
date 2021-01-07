//
//  Payripe_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^PayBlock)(NSString *showText);//给block重命名,方便调用
@interface Payripe_View : UIView
@property(nonatomic)NSDictionary *dic;
@property (weak, nonatomic) IBOutlet UITextField *num;
@property (weak, nonatomic) IBOutlet UILabel *KcNum;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (nonatomic, copy) PayBlock PayBlock;//声明一个block属性
-(void)creatView;
- (void)returnText:(PayBlock)block;//加上后方便第A视图书写该block方法

@end

NS_ASSUME_NONNULL_END
