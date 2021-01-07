//
//  PubLic_Class.m
//  EasyPet
//
//  Created by loyo_gaoqiang on 2017/9/26.
//  Copyright © 2017年 高强. All rights reserved.
//

#import "PubLic_Class.h"
#import "MBProgressHUD.h"

@implementation PubLic_Class
#pragma mark - 保留两位小数
+(NSString*)getTheCorrectNum:(NSString*)tempString
{
    //计算截取的长度
    NSUInteger endLength = tempString.length;
    //判断字符串是否包含 .
    if ([tempString containsString:@"."]) {
        //取得 . 的位置
        NSRange pointRange = [tempString rangeOfString:@"."];
        NSLog(@"%lu",pointRange.location);
        //判断 . 后面有几位
        NSUInteger f = tempString.length - 1 - pointRange.location;
        //如果大于2位就截取字符串保留两位,如果小于两位,直接截取
        if (f > 2) {
            endLength = pointRange.location + 2;
        }
    }
    //先将tempString转换成char型数组
    NSUInteger start = 0;
    const char *tempChar = [tempString UTF8String];
    //遍历,去除取得第一位不是0的位置
    for (int i = 0; i < tempString.length; i++) {
        if (tempChar[i] == '0') {
            start++;
        }else {
            break;
        }
    }
    //根据最终的开始位置,计算长度,并截取
    NSRange range = {start,endLength-start};
    tempString = [tempString substringWithRange:range];
    return tempString;
}
#pragma mark - 获取当前时间毫秒时间戳
+(NSString *)getNowTimeTimestamp3{

    long long time = [self getDateTimeTOMilliSeconds:[NSDate date]];

    NSLog(@"%llu",time);

    NSDate *dat = [self getDateTimeFromMilliSeconds:time];

    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];

    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss.SSS"];

    NSString *date =  [formatter stringFromDate:dat];

    NSString *timeLocal = [[NSString alloc] initWithFormat:@"%@", date];

    return timeLocal;
}
+(NSDate *)getDateTimeFromMilliSeconds:(long long) miliSeconds

{

NSTimeInterval tempMilli = miliSeconds;

NSTimeInterval seconds = tempMilli/1000.0;//这里的.0一定要加上，不然除下来的数据会被截断导致时间不一致

//NSLog(@"传入的时间戳=%f",seconds);

return [NSDate dateWithTimeIntervalSince1970:seconds];

}
+(long long)getDateTimeTOMilliSeconds:(NSDate *)datetime

{

    NSTimeInterval interval = [datetime timeIntervalSince1970];

//    NSLog(@"转换的时间戳=%f",interval);

    long long totalMilliseconds = interval*1000 ;

    NSLog(@"totalMilliseconds=%llu",totalMilliseconds);

    return totalMilliseconds;

}
#pragma mark -日期转换为 今天，昨天，日期
+(NSString *)compareDate:(NSDate *)date
{
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *yesterday;
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }
    else
    {
        return dateString;
    }
}

#pragma mark - 今天返回时间，否则返回带日期时间
+(NSString *)isToday:(NSString *)time
{
    NSString * today;
    NSString * todayString = [[[NSDate date] description] substringToIndex:10];
    if (![[time substringToIndex:4] isEqualToString:[todayString substringToIndex:4]]) {
        today = [time substringToIndex:time.length-3];
    }
    else
    {
        if ([[time substringToIndex:10] isEqualToString:todayString]) {
            today = [time substringWithRange:NSMakeRange(11, 5)];
        }
        else
            today = [time substringWithRange:NSMakeRange(5, 11)];
    }
    
    
    return today;
}

#pragma mark - date转字符串时间
+(NSString *)dateChangeString:(NSDate *)date
{
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* time = [df stringFromDate:date];
    return time;
}

#pragma mark - date转字符串时间
+(NSString *)dateString:(NSDate *)date
{
    NSDateFormatter*df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString* time = [df stringFromDate:date];
    return time;
}

#pragma mark - 时间差(格式-----@"2016-01-28 00:00:30")
+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    NSTimeInterval cha=late2-late1;
    
    
    
    return [NSString stringWithFormat:@"%d",(int)cha];
}

#pragma mark - 判断前面的字符串时间是否大于后面的,(格式2017-06-06 15:27:21)
+ (BOOL)maxDateStr: (NSString *) dateString1  toTheDate:(NSString *) dateString2{
    NSDate *date1;
    NSDate *date2;
    if (dateString1 == nil) {
        date1 = [NSDate dateWithTimeIntervalSince1970:0];
    }else{
        date1 = [self dateFrom:dateString1];
    }
    if (dateString2 == nil) {
        date2 = [NSDate dateWithTimeIntervalSince1970:0];
    }else{
        date2 = [self dateFrom:dateString2];
    }
    
    
    NSTimeInterval interval = [date1 timeIntervalSinceDate:date2];
    if (interval > 0) {
        return YES;
    }else{
        return NO;
    }
}
#pragma mark -//时间转NSDate
+ (NSDate *)dateFrom:(NSString *)timeStr
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//设定时间格式,这里可以设置成自己需要的格式
    
    NSDate *date =[dateFormat dateFromString:timeStr];
    return date;
}

#pragma mark- --正则表达式判断,邮箱，手机号,密码--
//邮箱
+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以13， 15，18 , 17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

// 判断密码格式（字母，数字，符号包含其中两个）
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[_#@]+$).{8,}";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}


//是否包含头特殊文字
+ (BOOL) validateNumber:(NSString *)Number
{
    //[1-9]\d{5}(?!\d)
    NSString *postNumberRegex = @"^([\u4e00-\u9fa5]+|[a-zA-Z]+)$";
    NSPredicate *postNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postNumberRegex];
    return [postNumberPredicate evaluateWithObject:Number];
}

//邮编验证
+ (BOOL) validatePostNumber:(NSString *)postNumber
{
    //[1-9]\}(?!\d)
    NSString *postNumberRegex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *postNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postNumberRegex];
    return [postNumberPredicate evaluateWithObject:postNumber];
}
//身份证校验
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//是不是网址
+ (BOOL) validateUrl:(NSString *)url
{
    BOOL flag;
    if (url.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^http://([w-]+.)+[w-]+(/[w-./?%&=]*)?$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:url];
}
#pragma mark-日期转换XX前
+(NSString *) compareCurrentTime:(NSString *) compareDate

{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [dateFormatter dateFromString:compareDate];
    
    NSTimeInterval  timeInterval = [confromTimesp timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
        
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else
    {
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

#pragma mark - json串转字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark - 字典转json
+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

#pragma mark - nsdata转dic
+(NSDictionary *)dataChangDic:(NSData *)data
{
    return  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark - 返回带红色星号字符串
+(NSMutableAttributedString *)getAttributedString:(NSString *)text{
    //创建一个NSMutableAttributedString
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attriString addAttribute:NSForegroundColorAttributeName  //文字颜色
                        value:[UIColor redColor]
                        range:NSMakeRange(0, 1)];
    return attriString;
}
#pragma mark - 生成对应颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGFloat imageW = 3;
    CGFloat imageH = 3;
    // 1.开启基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    
    // 3.拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
 #pragma mark-时间戳转字符串时间
+(NSString *)SJCchangeTime:(NSString *)time
{
    
    time = [NSString stringWithFormat:@"%@",time];
    if (time == nil || time.length < 3) {
        return @"              ";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[time doubleValue]];
    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return [confromTimespStr substringWithRange:NSMakeRange(0, confromTimespStr.length)];
}
#pragma mark-时间字符串转时间戳
+(NSString *)TimeChangeDate:(NSString *)time{
    NSDate *date=[self dateFrom:time];
    return [self TimeChangeSJC:date];
}
#pragma mark-NSDate转时间戳
+(NSString *)TimeChangeSJC:(NSDate *)date
{
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate:date];
    //    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]];
    return timeSp;
}

#pragma mark- --提示框--
+(void)addMBProgressViewTitle:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al
{
            MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:view];
            progress.removeFromSuperViewOnHide = YES;
    //    progress.activityIndicatorColor = [UIColor whiteColor];
            progress.labelText = title;
            progress.labelFont = [UIFont systemFontOfSize:14*rate];
            [progress setAlpha:al];
            [view addSubview:progress];
            [view bringSubviewToFront:progress];
            [progress show:YES];
}
+(void)addMBProgressViewTitle:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time
{
    MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:view];
    progress.removeFromSuperViewOnHide = YES;
    progress.mode = MBProgressHUDModeText;
    progress.labelText = title;
    progress.labelFont = [UIFont systemFontOfSize:14*rate];
    [progress setAlpha:al];
    [[UIApplication sharedApplication].keyWindow addSubview:progress];
    [[UIApplication sharedApplication].keyWindow bringSubviewToFront:progress];
    [progress show:YES];
    [progress hide:YES afterDelay:time];
}

+(void)addMBProgressView:(NSString*)title inView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time
{
    MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:view];
    progress.removeFromSuperViewOnHide = YES;
    //    progress.mode = MBProgressHUDModeIndeterminate;
    progress.labelText = title;
    progress.labelFont = [UIFont systemFontOfSize:14*rate];
    [progress setAlpha:al];
    [view addSubview:progress];
    [view bringSubviewToFront:progress];
    [progress show:YES];
    [progress hide:YES afterDelay:time];
}
+(void)addMBProgressInView:(UIView*)view alpha:(CGFloat)al hideDelayTime:(NSTimeInterval)time
{
    MBProgressHUD *progress = [[MBProgressHUD alloc] initWithView:view];
    progress.removeFromSuperViewOnHide = YES;
    [progress setAlpha:al];
    [[UIApplication sharedApplication].keyWindow addSubview:progress];
    progress.labelFont = [UIFont systemFontOfSize:14*rate];
    [view bringSubviewToFront:progress];
    [progress show:YES];
    [progress hide:YES afterDelay:time];
}
+(void)hideMBProgressViewForView:(UIView*)view
{
    dispatch_async(dispatch_get_main_queue(), ^{
      [MBProgressHUD hideAllHUDsForView:view animated:NO];
    });
}
/**
 数组转json

 @param array 传入数组
 @return 返回json串
 */
+(NSString *)arrayToJSONString:(NSArray *)array
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *s=[jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSString *ss=[s stringByReplacingOccurrencesOfString:@" " withString:@""];
    return s;
}
/**
 json转数组
 
 @param jsonStr json串
 @return 返回数组
 */
+(NSArray *)jsonToArray:(NSString *)jsonStr
{
    NSString *str=[jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if (str) {
        id tmp = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
        
        if (tmp) {
            if ([tmp isKindOfClass:[NSArray class]]) {
                
                return tmp;
                
            } else if([tmp isKindOfClass:[NSString class]]
                      || [tmp isKindOfClass:[NSDictionary class]]) {
                
                return [NSArray arrayWithObject:tmp];
                
            } else {
                return nil;
            }
        } else {
            return nil;
        }
        
    } else {
        return nil;
    }
}

/**
 判断字符串为空

 @param aStr 输入项
 @return 返回
 */
+ (BOOL)isBlankString:(NSString *)string {
     if (string == nil) {
        
         return YES;
        
         }
    
     if (string == NULL) {
        
         return YES;
        
         }
    
     if ([string isKindOfClass:[NSNull class]]) {
        
         return YES;
        
         }
    
//     if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
//
//         return YES;
//
//         }
    
     return NO;
}

/**
 判断字符串是否为空

 @param string 传入需要判断的字符串
 @return 返回判断值
 */
+(NSString *)returnNULLString:(NSString *)string
{
    if (string == nil) {
        
        return @"";
        
    }
    
    if (string == NULL) {
        
        return @"";
        
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        
        return @"";
        
    }
    
    //     if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
    //
    //         return YES;
    //
    //         }
    
    return string;
}
#pragma mark - 压缩图片
+(UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image)
    {
        newimage = nil;
    }
    else
    {
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height)
        {
            rect.size.width = asize.height* oldsize.width/ oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width) / 2;
            rect.origin.y =0;
        }
        else
        {
            rect.size.width = asize.width;
            rect.size.height = asize.width* oldsize.height/ oldsize.width;
            rect.origin.x =0;
            rect.origin.y = (asize.height - rect.size.height) / 2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context =UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor]CGColor]);
        UIRectFill(CGRectMake(0,0, asize.width, asize.height));
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}
#pragma mark - 数组转字符串
+(NSString *)arrayTotring:(NSArray *)array
{
    NSString *str;
    if (array.count==1) {
        return [NSString stringWithFormat:@"[%@]",array[0]];
    }
    for (int i = 0; i<array.count; i++) {
        str = [NSString stringWithFormat:@"[%@,%@]",str,array[i]];
    }
    return [str substringWithRange:NSMakeRange(1, str.length-1)];
}

#pragma mark - 返回跳闸类型
+(NSString *)returnType:(NSString *)typeVlaue
{
    NSArray *arr=[NSArray arrayWithObjects:@"鸟害",@"飘挂物",@"高杆植物",@"违章作业", nil];
    if ([typeVlaue isEqualToString:@"雷击"]) {
        return @"1";
    }
    else if ([arr containsObject:typeVlaue])
    {
        return @"2";
    }
    else
        return @"3";
}

/**
 日期比较
 
 @param t1 开始时间
 @param t2 结束时间
 @return 开始时间是都大于结束时间
 */
+(BOOL)comparedate:(NSString *)t1 anddate1:(NSString *)t2
{
    NSInteger Y = [[t1 substringToIndex:4] integerValue];
    NSInteger M = [[t1 substringWithRange:NSMakeRange(5, 2)] integerValue];
    NSInteger D = [[t1 substringWithRange:NSMakeRange(8, 2)] integerValue];
    
    NSInteger Y1 = [[t2 substringToIndex:4] integerValue];
    NSInteger M1 = [[t2 substringWithRange:NSMakeRange(5, 2)] integerValue];
    NSInteger D1 = [[t2 substringWithRange:NSMakeRange(8, 2)] integerValue];
    
    if (Y>Y1) {
        return NO;
    }
    else if (Y==Y1)
    {
        if (M>M1) {
            return NO;
        }
        else if (M==M1)
        {
            if (D>D1 || D==D1) {
                return NO;
            }
            else
                return YES;
        }
        else
        {
            return YES;
        }
    }
    else
    {
        return YES;
    }
}

/**
 两数组去重

 @param arr 数组1
 @param arr1 数组2
 @return 返回数组2去掉和数组1相同的元素
 */
+(NSArray *)delRepetition:(NSMutableArray *)arr and:(NSMutableArray *)arr1
{
    
    NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",arr];
    
    return [arr1 filteredArrayUsingPredicate:filterPredicate];
    
}

/**
 统计数组元素出现次数

 @param arr 传入数组
 @return 返回元素与出现次数字典数组
 */
+(NSMutableArray *)arrObjectCount:(NSMutableArray *)arr
{
    NSMutableArray *Datas=[NSMutableArray array];
    int days;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int q = 0; q < arr.count; q++) {
        
        days = 0; //在下次遍历前把days清零
        
        for (int l = 0; l < arr.count; l++) {

            if([arr objectAtIndex:q] == [arr objectAtIndex:l]) {
                
                days += 1;
                
            }
        }
        [dict setObject:[NSNumber numberWithInt:days] forKey:[arr objectAtIndex:q]];
        [Datas addObject:dict];
    }
    return Datas;
}

/**
 数组去重

 @param arr 传入数组
 @return 返回去重数组
 */
+(NSMutableArray *)arrdelRepetition:(NSMutableArray *)arr
{
    return [arr valueForKeyPath:@"@distinctUnionOfObjects.self"];
}


/**
 缩写与汉字转换

 @param str 输入缩写
 @return 返回对应汉字
 */
+(NSString *)SX:(NSString *)str
{
    if ([str isEqualToString:@"LJ"]) {
        return @"雷击";
    }else if ([str isEqualToString:@"PGW"])
    {
        return @"飘挂物";
    }
    else if ([str isEqualToString:@"WZZY"])
    {
        return @"违章作业";
    }
    else if ([str isEqualToString:@"GGZW"])
    {
        return @"高杆植物";
    }
    else if ([str isEqualToString:@"NH"])
    {
        return @"鸟害";
    }
    else if ([str isEqualToString:@"SBGZ"])
    {
        return @"设备故障";
    }
    else if ([str isEqualToString:@"DT"])
    {
        return @"倒塔";
    }
    else if ([str isEqualToString:@"DX"])
    {
        return @"断线";
    }
    else if ([str isEqualToString:@"DC"])
    {
        return @"掉串";
    }
    else if ([str isEqualToString:@"DF"])
    {
        return @"大风";
    }else if ([str isEqualToString:@"HZ"])
    {
        return @"火灾";
    }
    else if ([str isEqualToString:@"WS"])
    {
        return @"污闪";
    }
    else if ([str isEqualToString:@"BS"])
    {
        return @"冰闪";
    }
    
    
    else if ([str isEqualToString:@"雷击"]) {
        return @"LJ";
    }else if ([str isEqualToString:@"飘挂物"])
    {
        return @"PGW";
    }
    else if ([str isEqualToString:@"违章作业"])
    {
        return @"WZZY";
    }
    else if ([str isEqualToString:@"高杆植物"])
    {
        return @"GGZW";
    }
    else if ([str isEqualToString:@"鸟害"])
    {
        return @"NH";
    }
    else if ([str isEqualToString:@"设备故障"])
    {
        return @"SBGZ";
    }
    else if ([str isEqualToString:@"倒塔"])
    {
        return @"DT";
    }
    else if ([str isEqualToString:@"断线"])
    {
        return @"DX";
    }
    else if ([str isEqualToString:@"掉串"])
    {
        return @"DC";
    }
    else if ([str isEqualToString:@"大风"])
    {
        return @"DF";
    }else if ([str isEqualToString:@"火灾"])
    {
        return @"HZ";
    }
    else if ([str isEqualToString:@"污闪"])
    {
        return @"WS";
    }
    else if ([str isEqualToString:@"冰闪"])
    {
        return @"BS";
    }
    return @"其他";
}


/**
 传入文字类型，返回对应分类缩写

 @param type 文字类型
 @return 返回所属类型缩写
 */
+(NSString *)tripType:(NSString *)type
{
    NSArray *arr=[NSArray arrayWithObjects:@"NH",@"QGW",@"GGZW",@"WZZY", nil];
    NSArray *arr1=[NSArray arrayWithObjects:@"SBGZ",@"DT",@"DX",@"DC", nil];
    if ([type isEqualToString:@"LJ"]) {
        return @"LJ";
    }
    else if ([arr containsObject:type])
    {
        return @"WLPH";
    }
    else if ([arr1 containsObject:type])
    {
        return @"SBBT";
    }
    else
        return @"ZRHJ";
}

/**
 是不是合法杆塔名字

 @param str 输入的杆塔名字
 @return 返回是否是正确的杆塔名
 */
+(BOOL)GTName:(NSString *)str
{
    if (str.length>1) {
        NSString *th=[str substringToIndex:1];
        if ([th isEqualToString:@"N"] || [th isEqualToString:@"#"] || [th isEqualToString:@"n"]) {
            return YES;
        }
        else
            return NO;
    }
    else
        return NO;
}

/**
 绘制虚线

 @param view 绘制的View
 */
+ (void)addBorderToLayer2:(UIView *)view
{

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:view.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(view.frame) / 2, CGRectGetHeight(view.frame)/2)];
    
    [shapeLayer setStrokeColor:[UIColor lightGrayColor].CGColor];
    [shapeLayer setLineWidth:1];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:@[@3,@3]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    if (CGRectGetWidth(view.frame) > CGRectGetHeight(view.frame)) {
        CGPathAddLineToPoint(path, NULL, CGRectGetWidth(view.frame),0);
    }else{
        CGPathAddLineToPoint(path, NULL, 0,CGRectGetHeight(view.frame));
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    //  把绘制好的虚线添加上来
    [view.layer addSublayer:shapeLayer];
}



//图片转字符串
+(NSString *)UIImageToBase64Str:(UIImage *) image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
//字符串转图片
+(UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr
{
    NSData *_decodedImageData   = [[NSData alloc] initWithBase64Encoding:_encodedImageStr];
    UIImage *_decodedImage      = [UIImage imageWithData:_decodedImageData];
    return _decodedImage;
}

#pragma mark - 图片是否为空
+(BOOL)imgISNULL:(UIImage *)img
{
    CGImageRef cgref = [img CGImage];
    CIImage *cim = [img CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        return NO;
    } else {
        return YES;
    }
}
//获取当前网络状态  （iPhone X 上可能引发崩溃）
+ (BOOL)networkingStatesFromStatebar {
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];
    //iphone X 会在这里崩溃
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }
    
    
    if (type==0) {
        return NO;
    }
    else
        return YES;
}
#pragma mark - 判断版本号大小(判断前面的是否小于后面的)
+ (BOOL)version:(NSString *)currentVersion lessthan:(NSString *)newver //系统api
{
    return [currentVersion compare:newver options:NSNumericSearch] == NSOrderedAscending;
}

#pragma mark - 返回带红色星号的字符串
+(NSMutableAttributedString *)setOneStrRed:(NSString *)str
{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 1)];
    return AttributedStr;
}
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+(CGFloat)getStringHeightWithText:(NSString *)text font:(UIFont *)font viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName :font};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);

    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    // 计算文字占据的宽高
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;

   // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
}
+(CGFloat)getString:(NSString *)string lineSpacing:(CGFloat)lineSpacing font:(UIFont*)font width:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = lineSpacing;
    NSDictionary *dic = @{ NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle };
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return  ceilf(size.height);
}
//获取标签对中的图片
+(NSArray*)getImgTags:(NSString *)htmlText
{
    NSMutableArray *resultArray = [NSMutableArray array];

            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<(img|IMG)(.*?)(/>|></img>|>)" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
            NSArray *result = [regex matchesInString:htmlText options:NSMatchingReportCompletion range:NSMakeRange(0, htmlText.length)];
            
            for (NSTextCheckingResult *item in result) {
                NSString *imgHtml = [htmlText substringWithRange:[item rangeAtIndex:0]];
                
                NSArray *tmpArray = nil;
                if ([imgHtml rangeOfString:@"src=\""].location != NSNotFound) {
                    tmpArray = [imgHtml componentsSeparatedByString:@"src=\""];
                } else if ([imgHtml rangeOfString:@"src="].location != NSNotFound) {
                    tmpArray = [imgHtml componentsSeparatedByString:@"src="];
                }
                
                if (tmpArray.count >= 2) {
                    NSString *src = tmpArray[1];
                    
                    NSUInteger loc = [src rangeOfString:@"\""].location;
                    if (loc != NSNotFound) {
                        src = [src substringToIndex:loc];
                        [resultArray addObject:src];
                    }
                }
            }

        return resultArray;
}
@end
