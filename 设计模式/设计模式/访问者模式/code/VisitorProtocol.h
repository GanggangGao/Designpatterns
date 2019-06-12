//
//  VisitorProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//


#ifndef VisitorProtocol_h
#define VisitorProtocol_h

#import "WorkerProtocol.h"

@protocol WorkerProtocol;

@protocol VisitorProtocol <NSObject>
- (void)VisitBigWorker:(id<WorkerProtocol>)bigworker;
- (void)VisitSmallWorker:(id<WorkerProtocol>)smallworker;
- (void)VisitContractorWorker:(id<WorkerProtocol>)contractorWorker;
@end

#endif /* VisitorProtocol_h */


