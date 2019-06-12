//
//  HandlerTwo.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "HandlerTwo.h"

@implementation HandlerTwo
@synthesize nextHandler;

- (void)HandlerConditionlevel:(NSInteger)level {
    
    if(level == [self getLevel]){
        NSLog(@"HandlerTwo doing");
    }else{
        if(self.nextHandler != nil){
            [self.nextHandler HandlerConditionlevel:level];
        }else{
            NSLog(@"没有找到要执行的方法");
        }
    }
    
}

- (NSInteger)getLevel {
    return 2;
}

@end
