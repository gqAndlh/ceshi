//
//  JGCycleCollectionViewCell.m
//  UICollectionDemo
//
//  Created by 郭军 on 2019/6/6.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGCycleCollectionViewCell.h"

@implementation JGCycleCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _Icon = [[UIImageView alloc] initWithFrame:self.bounds];
        _Icon.layer.cornerRadius=5;
        _Icon.layer.masksToBounds=YES;
        [self addSubview:_Icon];
        
    }
    return self;
}




@end
