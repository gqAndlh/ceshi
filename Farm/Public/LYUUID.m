//
//  LYUUID.m
//  WHT
//
//  Created by coo on 16/3/21.
//  Copyright © 2016年 高强. All rights reserved.
//

#import "LYUUID.h"

const char DIGITS[] = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'J', 'K', 'M', 'N', 'P', 'Q', 'R', 'S',
    'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '1',
    '2', '3', '4', '5', '6', '7', '8', '9'
};

const int UUIDLENGTH = 16;//原来26
const int UUIDHALFLENGTH = UUIDLENGTH / 2;
@implementation LYUUID
+(NSString *)UUID{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFUUIDBytes uuidbytes = CFUUIDGetUUIDBytes(uuid);
    CFRelease(uuid);
    unsigned long msb = 0,lsb = 0;
    msb = ((unsigned long)uuidbytes.byte0 << 56) |
    ((unsigned long)uuidbytes.byte1 << 48) |
    ((unsigned long)uuidbytes.byte2 << 40) |
    ((unsigned long)uuidbytes.byte3 << 32) |
    ((unsigned long)uuidbytes.byte4 << 24) |
    ((unsigned long)uuidbytes.byte5 << 16) |
    ((unsigned long)uuidbytes.byte6 << 8) | (unsigned long)uuidbytes.byte7;
    
    
    lsb = ((unsigned long)uuidbytes.byte8 << 56) |
    ((unsigned long)uuidbytes.byte9 << 48) |
    ((unsigned long)uuidbytes.byte10 << 40) |
    ((unsigned long)uuidbytes.byte11 << 32) |
    ((unsigned long)uuidbytes.byte12 << 24) |
    ((unsigned long)uuidbytes.byte13 << 16) |
    ((unsigned long)uuidbytes.byte14 << 8) | (unsigned long)uuidbytes.byte15;
    
    char s[UUIDLENGTH + 1];
    unsigned int index = 0,i;
    for (i = 0; index < 13; i += 5){
        s[index ++] = DIGITS[(unsigned char)((msb >> i) & 0x1f)];
    }
    for (i = 0; index < UUIDLENGTH; i += 5){
        s[index ++] = DIGITS[(unsigned char)((lsb >> i) & 0x1f)];
    }
    s[index] = 0;
    
    NSString *str = [NSString stringWithUTF8String:s];
//    NSLog(@"%x",uuidbytes.byte0);
//    NSLog(@"%x",uuidbytes.byte1);
//    NSLog(@"%x",uuidbytes.byte2);
//    NSLog(@"%x",uuidbytes.byte3);
//    NSLog(@"%x",uuidbytes.byte4);
//    NSLog(@"%x",uuidbytes.byte5);
//    NSLog(@"%x",uuidbytes.byte6);
//    NSLog(@"%x",uuidbytes.byte7);
//    NSLog(@"%x",uuidbytes.byte8);
//    NSLog(@"%x",uuidbytes.byte9);
//    NSLog(@"%x",uuidbytes.byte10);
//    NSLog(@"%x",uuidbytes.byte11);
//    NSLog(@"%x",uuidbytes.byte12);
//    NSLog(@"%x",uuidbytes.byte13);
//    NSLog(@"%x",uuidbytes.byte14);
//    NSLog(@"%x",uuidbytes.byte15);
//    NSLog(@"uuid=%@",str);
    return str;
}
@end
