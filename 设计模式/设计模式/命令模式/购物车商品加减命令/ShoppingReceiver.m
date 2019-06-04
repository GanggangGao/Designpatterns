//
//  ShoppingReceiver.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ShoppingReceiver.h"

@interface ShoppingReceiver()


@end


@implementation ShoppingReceiver


//value 可以是任何Model
//如果使用了添加的操作，那么你的保存命令就应该是减少操作，这样才能撤销正确
-(void)increase:(id)value{
    
    NSInteger count = [value integerValue];
    self._count += count;
}

-(void)reduce:(id)value{
    
    NSInteger count = [value integerValue];
    if(self._count > 0)
        self._count -= count;
}
@end
