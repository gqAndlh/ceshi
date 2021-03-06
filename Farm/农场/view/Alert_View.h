//
//  Alert_View.h
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^AlertBlock)(NSString *showText);//给block重命名,方便调用
@interface Alert_View : UIView

@property (weak, nonatomic) IBOutlet UILabel *alertLab;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (nonatomic) BOOL isBoor;


@property (nonatomic, copy) AlertBlock AlertBlock;//声明一个block属性
- (void)returnText:(AlertBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
