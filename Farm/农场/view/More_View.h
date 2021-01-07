//
//  More_View.h
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^MoreBlock)(NSString *showText);//给block重命名,方便调用
@interface More_View : UIView
@property (nonatomic, copy) MoreBlock MyBlock;//声明一个block属性
- (void)returnText:(MoreBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
