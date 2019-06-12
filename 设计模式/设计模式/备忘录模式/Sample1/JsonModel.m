//
//  JsonModel.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "JsonModel.h"

@interface JsonModel()

@end

@implementation JsonModel

- (instancetype)initWithPoint:(NSInteger)point level:(NSInteger)level
{
    self = [super init];
    if (self) {
        self.point = point;
        self.level = level;
        self.JsonId = [NSString stringWithFormat:@"%ld",point + level];
    }
    return self;
}



@end
