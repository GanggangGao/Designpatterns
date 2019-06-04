//
//  dingcunbao.m
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import "dingcunbao.h"

@implementation dingcunbao

- (int)licaiwithMoth:(int)month money:(float)money{
    
    if(month == 3){
        return money + money * 0.07 / 12 * 3;
    }else if(month == 6){
        return money + money * 0.08 / 12 * 6;
    }else if(month == 9){
        return money + money * 0.09 / 12 * 9;
    }else if(month == 12){
        return money + money * 0.095/ 12 * 12;
    }else if(month == 24){
        return money + money * 0.105 / 12 * 24;
    }
    return 0;
}
@end
