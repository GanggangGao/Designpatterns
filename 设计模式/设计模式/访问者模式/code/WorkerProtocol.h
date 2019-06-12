//
//  WorkerProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#ifndef WorkerProtocol_h
#define WorkerProtocol_h

#import "VisitorProtocol.h"

@protocol VisitorProtocol;

@protocol WorkerProtocol <NSObject>

@property (nonatomic,copy)NSString *Name;

- (void)accptVisit:(id<VisitorProtocol>)visitor;

- (NSString*)getName;
- (NSString*)getTitle;
- (NSString*)getWorkingTime;

@end

#endif /* WorkerProtocol_h */

