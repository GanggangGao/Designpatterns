//
//  TerminatorExpression.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TerminatorExpression.h"

@interface TerminatorExpression()
@property (nonatomic,copy)NSString * number;

@end

@implementation TerminatorExpression

- (instancetype)initWithNumber:(NSString *)number
{
    self = [super init];
    if (self) {
        self.number = number;
    }
    return self;
}


- (CGFloat)interpretor {
    return [self.number floatValue];
}

@end
