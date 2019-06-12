//
//  UserProxy.m
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import "UserProxy.h"

@interface UserProxy ()

@property (nonatomic,weak)id<UserProtocol> user;

@end

@implementation UserProxy

- (instancetype)initWithUser:(id<UserProtocol>)user
{
    self = [super init];
    if (self) {
        self.user = user;
    }
    return self;
}

- (void)UserLogin{
    
    [self.user UserLogin];
    

    
}


@end
