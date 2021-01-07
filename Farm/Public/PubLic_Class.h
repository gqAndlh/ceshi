//
//  PubLic_Class.h
//  EasyPet
//
//  Created by loyo_gaoqiang on 2017/9/26.
//  Copyright © 2017年 高强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PubLic_Class : NSObject
#pragma mark - 保留两位小数
+(NSString*)getTheCorrectNum:(NSString*)tempString;
#pragma mark - 获取当前时间毫秒时间戳
+(NSString *)getNowTimeTimestamp3;
+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime;
 #pragma mark -日期转换为 今天，昨天，日期
+(NSString *)compareDate:(NSDate *)date;

#pragma mark - 今天返回时间，否则返回带日期时间
+(NSString *)isToday:(NSString *)time;

#pragma mark - date转字符串时间(yyyy-MM-dd HH:mm:ss)
+(NSString *)dateChangeString:(NSDate *)date;

#pragma mark - date转字符串日期时间(yyyy-MM-dd)
+(NSString *)dateString:(NSDate *)date;

#pragma mark-时间字符串转时间戳
+(NSString *)TimeChangeDate:(NSString *)time;

#pragma mark - 时间差
+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2;

#pragma mark - 判断前面的字符串时间是否大于后面的,(格式2017-06-06 15:27:21)
+ (BOOL)maxDateStr: (NSString *) dateString1  toTheDate:(NSString *) dateString2;

#pragma mark- --邮箱验证的正则表达式判断--
+ (BOOL) validateNumber:(NSString *)Number;
+ (BOOL) validateEmail:(NSString *)email;
+ (BOOL) validateMobile:(NSString *)mobile;
+ (BOOL) validatePassword:(NSString *)passWord;
+ (BOOL) validatePostNumber:(NSString *)postNumber;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
+ (BOOL) validateUrl:(NSString *)url;

#pragma mark-日期转换XX前
+ (NSString *) compareCurrentTime:(NSString *) compareDate;
#pragma mark - json串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
#pragma mark - 字典转json
+(NSString *)convertToJsonData:(NSDictionary *)dict;

#pragma mark - nsdata转dic
+(NSDictionary *)dataChangDic:(NSData *)data;

#pragma mark - 返回带红色星号字符串
+(NSMutableAttributedString *)getAttributedString:(NSString *)text;

#pragma mark - 生成对应颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

 #pragma mark -时间戳转字符串时间
+(NSString *)SJCchangeTime:(NSString *)time;

 #pragma mark -NSDate转时间戳
+(NSString *)TimeChangeSJC:(NSDate *)date;

#pragma mark- --提示框--
+(void)addMBProgressViewTitle:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al;
+(void)addMBProgressViewTitle:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time;
+(void)hideMBProgressViewForView:(UIView*)view;

+(void)addMBProgressInView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time;

+(void)addMBProgressView:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time;

/**
 数组转json
 
 @param array 传入数组
 @return 返回json串
 */
+(NSString *)arrayToJSONString:(NSArray *)array;

/**
 json转数组

 @param jsonStr json串
 @return 返回数组
 */
+(NSArray *)jsonToArray:(NSString *)jsonStr;
/**
 判断字符串为空
 
 @param aStr 输入项
 @return 返回
 */
+ (BOOL)isBlankString:(NSString *)string;
/**
 判断字符串是否为空
 
 @param string 传入需要判断的字符串
 @return 返回判断值
 */
+(NSString *)returnNULLString:(NSString *)string;

#pragma mark - 压缩图片
+(UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

#pragma mark - 数组转字符串
+(NSString *)arrayTotring:(NSArray *)array;
#pragma mark - 返回跳闸类型
+(NSString *)returnType:(NSString *)typeVlaue;

/**
 日期比较

 @param t1 开始时间
 @param t2 结束时间
 @return 开始时间是都大于结束时间
 */
+(BOOL)comparedate:(NSString *)t1 anddate1:(NSString *)t2;

/**
 两数组去重
 
 @param arr 数组1
 @param arr1 数组2
 @return 返回数组2去掉和数组1相同的元素
 */
+(NSArray *)delRepetition:(NSMutableArray *)arr and:(NSMutableArray *)arr1;

/**
 统计数组元素出现次数
 
 @param arr 传入数组
 @return 返回元素与出现次数字典数组
 */
+(NSMutableArray *)arrObjectCount:(NSMutableArray *)arr;
/**
 数组去重
 
 @param arr 传入数组
 @return 返回去重数组
 */
+(NSMutableArray *)arrdelRepetition:(NSMutableArray *)arr;
/**
 缩写转汉字
 
 @param str 输入缩写
 @return 返回对应汉字
 */
+(NSString *)SX:(NSString *)str;

/**
 传入文字类型，返回对应分类缩写
 
 @param type 文字类型
 @return 返回所属类型缩写
 */
+(NSString *)tripType:(NSString *)type;
/**
 是不是合法杆塔名字
 
 @param str 输入的杆塔名字
 @return 返回是否是正确的杆塔名
 */
+(BOOL)GTName:(NSString *)str;
/**
 绘制虚线
 
 @param view 绘制的View
 */
+ (void)addBorderToLayer2:(UIView *)view;
//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *) image;
//字符串转图片
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;
#pragma mark - 头像存储路径
+(NSString *)savePath;
#pragma mark - 图片是否为空
+(BOOL)imgISNULL:(UIImage *)img;

//获取当前网络状态  （iPhone X 上可能引发崩溃）
+ (BOOL)networkingStatesFromStatebar;
#pragma mark - 判断版本号大小(判断前面的是否小于后面的)
+ (BOOL)version:(NSString *)currentVersion lessthan:(NSString *)newver; //系统api

#pragma mark - 返回带红色星号的字符串
+(NSMutableAttributedString *)setOneStrRed:(NSString *)str;

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;
#pragma mark - 获取文字高度
+(CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width;
+(CGFloat)getString:(NSString *)string lineSpacing:(CGFloat)lineSpacing font:(UIFont*)font width:(CGFloat)width;
//获取标签对中的图片
+(NSArray*)getImgTags:(NSString *)htmlText;
@end
