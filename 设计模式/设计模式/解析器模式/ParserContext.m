//
//  ParserContext.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ParserContext.h"
#import "GGExpressionProtocol.h"
#import "TerminatorExpression.h"
#import "NonTerminatorExpression.h"
#import "SubtractionTerminatorExpression.h"
@interface ParserContext()
@property(nonatomic,strong)NSMutableArray<id<GGExpressionProtocol>> *Expressions;
@end

@implementation ParserContext


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.Expressions = [[NSMutableArray<id<GGExpressionProtocol>> alloc]init];
    }
    return self;
}

- (CGFloat)interpretorExpression:(NSString *)expression {

    NSArray *expressionArray = [expression componentsSeparatedByString:@" "];
    __block id<GGExpressionProtocol> left;
    __block id<GGExpressionProtocol> right;
    __weak typeof(self)weakself = self;
    [expressionArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx == 0){
            
            [weakself.Expressions addObject:[[TerminatorExpression alloc]initWithNumber:obj]];
        }
        
        if([obj isEqualToString:@"+"]){
            left = [self.Expressions objectAtIndex:0];
            [self.Expressions removeAllObjects];
            
            right = [[TerminatorExpression alloc]initWithNumber:[expressionArray objectAtIndex:idx + 1]];
            [self.Expressions addObject:[[NonTerminatorExpression alloc]initWithleft:left right:right]];
            
        }else if([obj isEqualToString:@"-"]){
            
            left = [self.Expressions objectAtIndex:0];
            [self.Expressions removeAllObjects];
            right = [[TerminatorExpression alloc]initWithNumber:[expressionArray objectAtIndex:idx + 1]];
           
            [self.Expressions addObject:[[SubtractionTerminatorExpression alloc]initWithleft:left right:right]];
        }

    }];
    
    id<GGExpressionProtocol> num = [self.Expressions objectAtIndex:0];
    
    
    return [num interpretor];
    
}


@end
