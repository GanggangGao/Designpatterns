//
//  ShoppingReceiver.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingReceiver : NSObject
@property(nonatomic,assign)NSInteger _count;

-(void)increase:(NSString *)value;

-(void)reduce:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
