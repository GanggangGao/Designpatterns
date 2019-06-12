//
//  SmallWorker.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "SmallWorker.h"


@interface  SmallWorker() 

@end

@implementation SmallWorker
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
    return @"小工";
}
- (NSString*)getWorkingTime{
    return @"3年";
}


- (void)accptVisit:(id<VisitorProtocol>)visitor{
    [visitor VisitSmallWorker:self];
}


@end
