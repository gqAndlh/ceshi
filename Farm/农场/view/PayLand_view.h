//
//  PayLand_view.h
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^PayLandBlock)(NSString *showText);//给block重命名,方便调用
@interface PayLand_view : UIView
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UILabel *numlab;
@property (weak, nonatomic) IBOutlet UIButton *subBtn;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (nonatomic, copy) PayLandBlock PayLandBlock;//声明一个block属性

-(void)creatView;
- (void)returnText:(PayLandBlock)block;//加上后方便第A视图书写该block方法

@end

NS_ASSUME_NONNULL_END
