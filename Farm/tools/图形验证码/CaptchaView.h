//
//  CaptchaView.h
//  QMGP
//
//  Created by mac on 2020/10/29.
//  Copyright © 2020 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CaptchaView : UIView
@property(nonatomic)NSMutableString *changeString;
@property(nonatomic)NSMutableArray *changeArray;
-(void)reloadCode;
@end

NS_ASSUME_NONNULL_END
