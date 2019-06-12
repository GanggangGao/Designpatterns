//
//  ContractorWorker.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ContractorWorker.h"

@interface  ContractorWorker() 

@end

@implementation ContractorWorker
@synthesize Name;
- (instancetype)initName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.Name = name;
    }
    return self;
}


- (NSInteger)getProjectCount{
    return 3;
}

- (NSString*)getName{
    return self.Name;
}
- (NSString*)getTitle{
    return @"包工头";
}
- (NSString*)getWorkingTime{
    return @"1年";
}

- (void)accptVisit:(id<VisitorProtocol>)visitor{
    [visitor VisitContractorWorker:self];
    
    
}

@end
