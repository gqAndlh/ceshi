//
//  NSString+MD5.m
//  TencentOAuth
//
//  Created by zhuxuehang on 14-3-21.
//  Copyright (c) 2014年 zhuxuehang. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)
- (NSString *)md5Encrypt {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
//    TLLOG(@"md5加密大写：%@",[hash uppercaseString]);
//    TLLOG(@"md5加密小写：%@",[hash lowercaseString]);
    return [hash lowercaseString];
}
//- (NSString *)leftMoveEncryptWithBit:(int)movebits
//{
////    self
//}
@end
