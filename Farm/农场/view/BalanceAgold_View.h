//
//  BalanceAgold_View.h
//  Farm
//
//  Created by mac on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BalanceAgold_View : UIView
@property (weak, nonatomic) IBOutlet UILabel *num;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (weak, nonatomic) IBOutlet UILabel *KyLab;
@property (weak, nonatomic) IBOutlet UILabel *DjLab;
@property (weak, nonatomic) IBOutlet UILabel *KyNum;
@property (weak, nonatomic) IBOutlet UILabel *DjNum;
@property (weak, nonatomic) IBOutlet UIView *line;


@property (nonatomic)NSDictionary *dic;
@property (nonatomic)int type;
@end

NS_ASSUME_NONNULL_END
