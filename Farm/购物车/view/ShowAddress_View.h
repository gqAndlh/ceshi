//
//  ShowAddress_View.h
//  Farm
//
//  Created by mac on 2020/12/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^addBlock)(NSString *showText);//给block重命名,方便调用
@interface ShowAddress_View : UIView
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UIView *addressView;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;
-(void)creatView;
@property (nonatomic, copy) addBlock addBlock;//声明一个block属性

- (void)returnText:(addBlock)block;//加上后方便第A视图书写该block方法
@end

NS_ASSUME_NONNULL_END
