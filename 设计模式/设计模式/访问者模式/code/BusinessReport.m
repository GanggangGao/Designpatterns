//
//  BusinessReport.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BusinessReport.h"
#import "VisitorProtocol.h"
#import "WorkerProtocol.h"
#import "SmallWorker.h"
#import "BigWorker.h"
#import "ContractorWorker.h"
@interface  BusinessReport()
@property (nonatomic,strong)NSMutableArray<id<WorkerProtocol>> *MutableArray;
@end

@implementation BusinessReport

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.MutableArray = [[NSMutableArray alloc]init];
        [self.MutableArray addObject:[[ContractorWorker alloc]initName:@"高中兴"]];
        [self.MutableArray addObject:[[ContractorWorker alloc]initName:@"李建豪"]];
        [self.MutableArray addObject:[[BigWorker alloc]initName:@"高宏安"]];
        [self.MutableArray addObject:[[SmallWorker alloc]initName:@"李亚辉"]];
        [self.MutableArray addObject:[[SmallWorker alloc]initName:@"王涵"]];
    }
    return self;
}

- (void)ShowReport:(id<VisitorProtocol>)visitor{
    
    for (id<WorkerProtocol>worker in self.MutableArray) {
        [worker accptVisit:visitor];
    }
    
}

@end
