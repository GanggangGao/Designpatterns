//
//  FamilySpendNB.h
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpendMoneyModel.h"
#import "FamilySpendProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface FamilySpendNB : NSObject<FamilySpendProtocol>
//下一个家庭成员
@property (nonatomic,strong) FamilySpendNB *nextFamilyMember;
//花钱
- (void)ReportSpendMenory:(SpendMoneyModel *)Money;

@end

NS_ASSUME_NONNULL_END
