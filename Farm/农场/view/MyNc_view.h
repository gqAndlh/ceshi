//
//  MyNc_view.h
//  Farm
//
//  Created by mac on 2020/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^MyBlock)(NSString *showText);//给block重命名,方便调用
@interface MyNc_view : UIView
@property (nonatomic, copy) MyBlock MyBlock;//声明一个block属性
//@property (weak, nonatomic) IBOutlet UILabel *num;
//@property (weak, nonatomic) IBOutlet UILabel *numlab;
//@property (weak, nonatomic) IBOutlet UIButton *subBtn;
//@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *seedBtn;
@property (weak, nonatomic) IBOutlet UIButton *boorBtn;
@property (weak, nonatomic) IBOutlet UILabel *typeBack;
@property (weak, nonatomic) IBOutlet UIButton *landBtn;
@property (weak, nonatomic) IBOutlet UILabel *alertLab;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *typeNum;
@property (weak, nonatomic) IBOutlet UIImageView *ripe;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property (weak, nonatomic) IBOutlet UIButton *seed;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;


-(void)creatView;
- (void)returnText:(MyBlock)block;//加上后方便第A视图书写该block方法

@end

NS_ASSUME_NONNULL_END
