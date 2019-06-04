//
//  LicensePlateNumber.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "LicensePlateNumber.h"

@implementation LicensePlateNumber

- (instancetype)initWithID:(NSString *)Id
{
    self = [super init];
    if (self) {
        self.Id = Id;
    }
    return self;
}


- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    
    return [[LicensePlateNumber alloc]initWithID:self.Id];
    
}




@end

