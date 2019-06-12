//
//  GGHandlerNB.h
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGRequest.h"
#import "GGHandlerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface GGHandlerNB : NSObject<GGHandlerProtocol>

@property (nonatomic,strong) GGHandlerNB* nextHandler;

- (void)HandlerRequest:(GGRequest*)request;

@end

NS_ASSUME_NONNULL_END
