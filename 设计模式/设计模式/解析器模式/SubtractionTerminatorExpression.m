//
//  SubtractionTerminatorExpression.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "SubtractionTerminatorExpression.h"
@interface SubtractionTerminatorExpression()
@property (nonatomic,strong)id<GGExpressionProtocol> left;
@property (nonatomic,strong)id<GGExpressionProtocol> right;

@end
@implementation SubtractionTerminatorExpression


- (instancetype)initWithleft:(id<GGExpressionProtocol>)left right:(id<GGExpressionProtocol>)right
{
    self = [super init];
    if (self) {
        self.left = left;
        self.right = right;
    }
    return self;
}



- (CGFloat)interpretor {
    return [self.left interpretor] - [self.right interpretor];
}

@end
