//
//  PayBoorASeed_View.h
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^PayBlock)(NSString *showText);//给block重命名,方便调用
@interface PayBoorASeed_View : UIView
@property (nonatomic, copy) PayBlock PayBlock;//声明一个block属性
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UILabel *numlab;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *seedBtn;
@property (weak, nonatomic) IBOutlet UIButton *boorBtn;
@property (weak, nonatomic) IBOutlet UILabel *typeBack;
@property (weak, nonatomic) IBOutlet UILabel *KcNum;

@property (nonatomic)BOOL isBoor;




-(void)creatView;
- (void)returnText:(PayBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
