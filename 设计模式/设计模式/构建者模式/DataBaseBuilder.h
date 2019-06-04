//
//  DataBaseBuilder.h
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseBuilderParams.h"
#import "DataBaseDanPin.h"
#import "DataBaseOrganization.h"


@class DataBaseBuilder;
@class DataBaseOrganization;
@class DataBaseDanPin;
@class DataBaseBuilderParams;


typedef DataBaseBuilder *(^CreateDataBaseBuilderBlock)(NSString *value);
typedef DataBaseOrganization *(^CreateDataBaseOrganizationBlock)();
typedef DataBaseDanPin *(^CreateDataBaseDanPinBlock)();

//NS_ASSUME_NONNULL_BEGIN
//角色二 构建者
@interface DataBaseBuilder : NSObject

@property (nonatomic,strong) DataBaseBuilderParams * Params;

-(CreateDataBaseBuilderBlock)Name;
-(CreateDataBaseBuilderBlock)Type;
- (CreateDataBaseDanPinBlock)BuildDanPin;

@end

//NS_ASSUME_NONNULL_END
