//
//  myInfo_Cell.m
//  Farm
//
//  Created by mac on 2020/12/10.
//

#import "myInfo_Cell.h"

@implementation myInfo_Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    #define ARC4RANDOM_MAX      0x100000000
    double val = ((double)arc4random() / ARC4RANDOM_MAX);
    _progess.progress=val;
    
    // Initialization code
}

@end
