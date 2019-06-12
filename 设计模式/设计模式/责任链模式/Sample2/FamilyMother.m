//
//  FamilyMother.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "FamilyMother.h"

@implementation FamilyMother


- (CGFloat)SpendMoneyLimit {
    return 999999999;
}

- (NSString *)getFamilyName {
    return @"妈妈";
}

- (void)handler:(SpendMoneyModel*)MoneyModel{
    
    NSLog(@"家庭成员：%@同意了你买东西",[self getFamilyName]);
    NSLog(@"%@，%@，%f",MoneyModel.things,MoneyModel.role,MoneyModel.money);
    
}



@end
