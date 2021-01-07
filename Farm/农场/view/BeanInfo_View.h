//
//  BeanInfo_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>
typedef void (^BeanBlock)(NSString *showText);//给block重命名,方便调用
NS_ASSUME_NONNULL_BEGIN

@interface BeanInfo_View : UIView
@property (nonatomic, copy) BeanBlock BeanBlock;//声明一个block属性
@property (weak, nonatomic) IBOutlet UILabel *num;

@property (weak, nonatomic) IBOutlet UILabel *KyLab;
@property (weak, nonatomic) IBOutlet UILabel *DjLab;
@property (weak, nonatomic) IBOutlet UILabel *KyNum;
@property (weak, nonatomic) IBOutlet UILabel *DjNum;

@property (nonatomic)NSDictionary *dic;
- (void)returnText:(BeanBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
