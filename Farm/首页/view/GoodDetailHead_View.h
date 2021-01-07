//
//  GoodDetailHead_View.h
//  Farm
//
//  Created by mac on 2020/12/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^GoodBlock)(NSString *showText);//给block重命名,方便调用
@interface GoodDetailHead_View : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic)NSMutableArray *arr;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (nonatomic)UICollectionView *collectionView;
@property (nonatomic)NSMutableArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *LikeLab;

@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *allGoodBtn;


@property (nonatomic, copy) GoodBlock GoodBlock;//声明一个block属性

- (void)returnText:(GoodBlock)block;//加上后方便第A视图书写该block方法
-(void)creatView;
@end

NS_ASSUME_NONNULL_END
