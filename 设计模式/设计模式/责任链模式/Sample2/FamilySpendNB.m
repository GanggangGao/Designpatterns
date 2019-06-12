//
//  FamilySpendNB.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "FamilySpendNB.h"

@implementation FamilySpendNB
@synthesize nextFamilyMember;


//花钱
- (void)ReportSpendMenory:(SpendMoneyModel *)Money{
    
    if( [self SpendMoneyLimit] >= Money.money){
        [self handler:Money];
    }else{
        if(self.nextFamilyMember != nil){
            [self.nextFamilyMember ReportSpendMenory:Money];
        }else{
            NSLog(@"没找到相关的方法");
        }
    }
}

- (CGFloat)SpendMoneyLimit {
    return 50;
}

- (NSString *)getFamilyName {
    return @"";
}

- (void)handler:(SpendMoneyModel*)MoneyModel{
    
}



@end
