//
//  HomeHead_View.h
//  Farm
//
//  Created by mac on 2020/12/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^MenuBlock)(NSInteger type);//给block重命名,方便调用
@interface HomeHead_View : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIScrollView *scr;
@property (weak, nonatomic) IBOutlet UIView *line;

@property (nonatomic, copy) MenuBlock MenuBlock;//声明一个block属性
- (void)returnText:(MenuBlock)block;//加上后方便第A视图书写该block方法
-(void)creatView;
@end

NS_ASSUME_NONNULL_END
