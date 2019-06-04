//
//  ShoppingDynamicCommandManager.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingDynamicCommand.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShoppingDynamicCommandManager : NSObject

@property(nonatomic,strong)ShoppingReceiver *Commodity;

-(instancetype)init:(ShoppingReceiver*)Commodity;

-(void)increase:(id)value;

-(void)reduce:(id)value;

-(void)Undo;
@end

NS_ASSUME_NONNULL_END
