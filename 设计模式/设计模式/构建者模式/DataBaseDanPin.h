//
//  DataBaseDanPin.h
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseBuilderParams.h"

@class DataBaseBuilderParams;

@class DataBaseDanPin;

typedef DataBaseDanPin *(^CreateDataBaseDanPinBlock)();


//NS_ASSUME_NONNULL_BEGIN
// 角色三 产品
@interface DataBaseDanPin : NSObject
@property (nonatomic,readonly) NSString *Type;
@property (nonatomic,readonly) NSString *Name;

- (instancetype)initWithParameter:(DataBaseBuilderParams *)Params;
- (CreateDataBaseDanPinBlock)Print;
@end

//NS_ASSUME_NONNULL_END
