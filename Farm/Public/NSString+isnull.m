//
//  NSString+isnull.m
//  Trip
//
//  Created by loyo_gaoqiang on 2018/3/26.
//  Copyright © 2018年 高强. All rights reserved.
//

#import "NSString+isnull.h"

@implementation NSString (isnull)

/**
 字符串处理
 @return 为空返回空字符串@“”，反之返回原字符串
 */
-(NSString *)backNullString
{
    if (self == nil) {
        
        return @"";
        
    }
    
    else if (self == NULL) {
        
        return @"";
        
    }
    
    else if ([self isKindOfClass:[NSNull class]]) {
        
        return @"";
        
    }
    else if ([self isEqualToString:@"<null>"]) {
        
        return @"";
        
    }
    else if ([self isEqualToString:@"(null)"]) {
        
        return @"";
        
    }
    else
        return self;
}

+ (NSString *)uuidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}

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
//纯中文
- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
//字母数字8-16
-(BOOL)judgePassWordLegal{
 BOOL result = false;
 if ([self length] >= 8 && [self length] <= 16){
 // 判断长度大于8位后再接着判断是否同时包含数字和字符
 NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
 NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
 result = [pred evaluateWithObject:self];
 }
 return result;

}
@end
