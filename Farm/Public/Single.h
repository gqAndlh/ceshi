//
//  Single.h
//  QMGP
//
//  Created by apple on 2020/9/17.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Single : NSObject

@property(nonatomic)NSString *mission_open;// 会员是否可以做任务
@property(nonatomic)NSString *register_open;// 开放注册
@property(nonatomic)NSString *end;// 会员做任务结束时间
@property(nonatomic)NSString *member_open;// 是否开启登录
@property(nonatomic)NSString *start;// 会员做任务开始时间
@property(nonatomic)int IsCFCC;// 是否显示CFCC
@property(nonatomic)NSString *IsWallet;// 是否显示钱包
@property(nonatomic)NSString *IsApprove;// 是否显示认证
@property(nonatomic)NSString *iosState;// ios端是否维护
@property(nonatomic)NSString *isVip;// 特殊用户
@property(nonatomic)NSString *Version;//版本号
@property(nonatomic)int VIP;// 是否有VIP
@property(nonatomic)NSString *ISSHOWVIP;// 是否显示开通VIP
@property(nonatomic)NSString *PAYVIP;        //是否有公告
@property(nonatomic)NSString *HeadImg;        //头像

@property(nonatomic)NSString *transStartTime;        //交易开始时间
@property(nonatomic)NSString *transEndTime;        //交易结束时间
@property(nonatomic)NSString *transMin;        //交易最小数量
@property(nonatomic)NSString *transMax;        //交易最大数量
@property(nonatomic)NSString *transaction_price;        //交易单价
@property(nonatomic)NSString *transaction_fee;        //交易守望续费
@property(nonatomic)NSString *transaction_status;        //交易市场状态
@property(nonatomic)NSString *transaction_count_down_buy;        //3600
@property(nonatomic)NSString *transaction_count_down_seller;        //1800
@property(nonatomic)NSString *transaction_usdt;        //美元

@property(nonatomic)NSString *WX;        //微信号
@property(nonatomic)NSString *WXImg;        //微信二维码

@property(nonatomic)NSString *bankNum;        //银行卡
@property(nonatomic)NSString *alipay_account;        //支付宝
@property(nonatomic)NSString *id_num;        //身份证


@property(nonatomic)NSString *mail;// 邮箱

@property(nonatomic)BOOL isNet;

@property(nonatomic)BOOL isLogin;


@property(assign,nonatomic)BOOL isHeadView;

@property(nonatomic)BOOL ISCreatWallet;

+(instancetype)sharedInstance;


/**
 *  储存字符串到??钥匙串
 *
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSString *)sValue key:(NSString *)sKey;


/**
 *  从??钥匙串获取字符串
 *
 *  @param sKey 对应的Key
 *
 *  @return 返回储存的Value
 */
+ (NSString *)readKeychainValue:(NSString *)sKey;


/**
 *  从??钥匙串删除字符串
 *
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;
@end

NS_ASSUME_NONNULL_END
