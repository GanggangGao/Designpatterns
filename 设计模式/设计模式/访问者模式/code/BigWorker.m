//
//  BigWorker.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BigWorker.h"


@interface  BigWorker() 

@end


@implementation BigWorker
@synthesize Name;

- (instancetype)initName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.Name = name;
    }
    return self;
}


- (NSString*)getName{
    return self.Name;
}
- (NSString*)getTitle{
    return @"大工";
}
- (NSString*)getWorkingTime{
    return @"2年";
}

- (void)accptVisit:(id<VisitorProtocol>)visitor{
    [visitor VisitBigWorker:self];
}




@end
