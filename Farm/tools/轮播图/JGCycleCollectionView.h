//
//  JGCycleCollectionView.h
//  UICollectionDemo
//
//  Created by 郭军 on 2019/6/6.
//  Copyright © 2019 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^URLBlock)(NSString* url);//给block重命名,方便调用
@interface JGCycleCollectionView : UIView

@property (nonatomic, strong) NSArray<NSString *> *data;


/**
 自动翻页 默认 NO
 */
@property (nonatomic, assign) BOOL autoPage;
@property (nonatomic, copy) URLBlock URLBlock;//声明一个block属性
- (void)returnText:(URLBlock)block;//加上后方便第A视图书写该block方法

@end

NS_ASSUME_NONNULL_END
