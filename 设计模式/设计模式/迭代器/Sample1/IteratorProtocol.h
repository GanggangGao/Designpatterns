//
//  IteratorProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/2.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol IteratorProtocol <NSObject>
- (id)next;
- (BOOL)hasNext;
@end

NS_ASSUME_NONNULL_END
