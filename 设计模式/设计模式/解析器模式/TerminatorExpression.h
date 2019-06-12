//
//  TerminatorExpression.h
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GGExpressionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TerminatorExpression : NSObject<GGExpressionProtocol>
- (instancetype)initWithNumber:(NSString *)number;
@end

NS_ASSUME_NONNULL_END
