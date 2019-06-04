//
//  ZhaocaibaoLicai.m
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ZhaocaibaoLicai.h"

@implementation ZhaocaibaoLicai

- (int)licaiwithMoth:(int)month money:(float)money{
    
    if(month == 6){
        return money + money * 0.03 / 12 * 6;
    }else if(month == 12){
        return money + money * 0.04 / 12 * 12;
    }else if(month == 24){
        return money + money * 0.045 / 12 * 24;
    }
    return 0;
}

@end
