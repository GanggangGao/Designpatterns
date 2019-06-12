//
//  SmallWorker.h
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkerProtocol.h"


@protocol WorkerProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface SmallWorker : NSObject<WorkerProtocol>

- (instancetype)initName:(NSString *)name;



@end

NS_ASSUME_NONNULL_END
