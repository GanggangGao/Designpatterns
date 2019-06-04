
//
//  UserModel.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)init:(NSString *)title name:(NSString *)name;
{
    self = [super init];
    if (self) {
        self.title = title;
        self.name = name;
    }
    return self;
}

@end
