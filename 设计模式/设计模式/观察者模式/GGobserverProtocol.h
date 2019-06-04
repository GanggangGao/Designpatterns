//
//  GGobserverProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GGobservableProtocol;

@protocol GGobserverProtocol <NSObject>

- (void)GGObserverisChanged;

- (void)GGObserverisChanged:(id<GGobservableProtocol>)servable msg:(NSString *)msg;


@end
