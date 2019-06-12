//
//  BossVisitor.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BossVisitor.h"
#import "BigWorker.h"
#import "SmallWorker.h"
#import "ContractorWorker.h"

@implementation BossVisitor

- (instancetype)initName:(NSString *)name
{
    self = [super init];
    if (self) {
        NSLog(@"老板：%@查看了公司的人事",name);
    }
    return self;
}

- (void)VisitBigWorker:(id<WorkerProtocol>)bigworker{
    
    BigWorker *big = bigworker;
    NSLog(@"职称：%@，名字：%@，工作时间:%@",[big getTitle],[big getName],[big getWorkingTime]);
    
}
- (void)VisitSmallWorker:(id<WorkerProtocol>)smallworker{
    
    SmallWorker *small = smallworker;
    NSLog(@"职称：%@，名字：%@，工作时间:%@",[small getTitle],[small getName],[small getWorkingTime]);
    
}
- (void)VisitContractorWorker:(id<WorkerProtocol>)contractorWorker{
   
    ContractorWorker *contractor = contractorWorker;
    NSLog(@"职称：%@，名字：%@，工作时间:%@，参与工程数：%ld",
          [contractor getTitle],[contractor getName],[contractor getWorkingTime],[contractor getProjectCount]);
}


@end
