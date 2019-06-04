//
//  GGContreteObservable.m
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GGContreteObservable.h"

@interface GGContreteObservable()
@property (nonatomic,strong)NSMutableArray *GGMutableArray;
@property (nonatomic,assign)BOOL GGisChange;  //YES 改变  //NO没改变
@end

@implementation GGContreteObservable

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.GGMutableArray = [[NSMutableArray alloc]init];
        self.GGisChange = NO;
    }
    return self;
}



- (void)GG_AddObserver:(id<GGobserverProtocol>)observer{
    [self.GGMutableArray addObject:observer];
}

- (void)GG_RemoveObserver:(id<GGobserverProtocol>)observer{
    [self.GGMutableArray removeObject:observer];
}

- (void)GG_NotificationObserver{
    

    
    [self.GGMutableArray enumerateObjectsUsingBlock:^(id<GGobserverProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj GGObserverisChanged];
    }];
    
    //通知已经发送完成， 改变已经发生
    [self GG_DidChange];
    
}

- (void)GG_NotificationObserver:(NSString *)msg{
    [self.GGMutableArray enumerateObjectsUsingBlock:^(id<GGobserverProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj GGObserverisChanged:self msg:msg];
    }];
    //通知已经发送完成， 改变已经发生
    [self GG_DidChange];
}

- (NSInteger)GG_ObserverCount{
    
    return self.GGMutableArray.count;
    
}

- (void)GG_DidChange{
    self.GGisChange = YES;
}

- (void)GG_ClearChanged{
    self.GGisChange = NO;
}

- (BOOL)GG_isChange{
    
    return self.GGisChange;
}

@end
