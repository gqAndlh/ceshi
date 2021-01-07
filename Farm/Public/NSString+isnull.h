//
//  NSString+isnull.h
//  Trip
//
//  Created by loyo_gaoqiang on 2018/3/26.
//  Copyright © 2018年 高强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (isnull)


/**
 字符串处理

 @return 为空返回空字符串@“”，反之返回原字符串
 */
-(NSString *)backNullString;
+ (NSString *)uuidString;
- (NSString *)md5Encrypt;
- (NSString *)md5Encrypt;
- (BOOL)isChinese;//判断是否是纯汉字
-(BOOL)judgePassWordLegal;//英文数字密码
@end
