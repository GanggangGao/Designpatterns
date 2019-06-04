//
//  GGobservableProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

@protocol GGobserverProtocol;

@protocol GGobservableProtocol <NSObject>

- (void)GG_AddObserver:(id<GGobserverProtocol>)observer;

- (void)GG_RemoveObserver:(id<GGobserverProtocol>)observer;

- (void)GG_NotificationObserver;

- (void)GG_NotificationObserver:(NSString *)msg;

- (NSInteger)GG_ObserverCount;

- (void)GG_DidChange;

- (void)GG_ClearChanged;

- (BOOL)GG_isChange;



@end
