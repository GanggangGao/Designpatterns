//
//  DataBaseDanPin.m
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DataBaseDanPin.h"

@interface DataBaseDanPin()

//默认我不想让别人知道的值
@property (nonatomic,copy) NSString *uuid;
@property (nonatomic,copy) NSString *Type;
@property (nonatomic,copy) NSString *Name;

@end


@implementation DataBaseDanPin


- (instancetype)initWithParameter:(DataBaseBuilderParams *)Params
{
    self = [super init];
    if (self) {
        self.uuid = @"111";
        self.Name = Params.name;
        self.Type = Params.Type;
    }
    return self;
}



- (CreateDataBaseDanPinBlock)Print{
    
    
    __weak typeof(self)weakself = self;
    return ^DataBaseDanPin * () {
        
        NSLog(@"Name = %@,Type = %@",self.Name,self.Type);
        NSLog(@"私有的内容 uuid = %@",self.uuid);
        
        return weakself;
        
    };
    
}



@end
