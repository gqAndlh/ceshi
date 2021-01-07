//
//  LandView.h
//  Farm
//
//  Created by mac on 2020/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LandView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *land;
@property (weak, nonatomic) IBOutlet UIImageView *boor;
@property (weak, nonatomic) IBOutlet UIImageView *noripe;
@property (weak, nonatomic) IBOutlet UIImageView *bean;
@property (weak, nonatomic) IBOutlet UIImageView *ripe;
@property (weak, nonatomic) IBOutlet UIButton *LockBtn;
@property (nonatomic)int index;
@end

NS_ASSUME_NONNULL_END
