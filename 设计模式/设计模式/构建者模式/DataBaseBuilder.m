//
//  DataBaseBuilder.m
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DataBaseBuilder.h"

@implementation DataBaseBuilder


- (instancetype)init;
{
    self = [super init];
    if (self) {
        self.Params = [[DataBaseBuilderParams alloc]init];;
    }
    return self;
}


-(CreateDataBaseBuilderBlock)Name{

    __weak typeof(self)weakself = self;
    return ^DataBaseBuilder * (NSString *value) {
        weakself.Params.name = value;
        return weakself;
    };
}


-(CreateDataBaseBuilderBlock)Type{
    
    __weak typeof(self)weakself = self;
    return ^DataBaseBuilder * (NSString *value) {
        weakself.Params.Type = value;
        return weakself;
    };
}

- (CreateDataBaseDanPinBlock)BuildDanPin{
    
    __weak typeof(self)weakself = self;
    return ^DataBaseDanPin * () {
      
        return [[DataBaseDanPin alloc]initWithParameter:weakself.Params];
        
    };
    
}

@end
