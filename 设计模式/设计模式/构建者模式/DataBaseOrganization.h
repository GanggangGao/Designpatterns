//
//  DataBaseOrganization.h
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseBuilder.h"

@class DataBaseBuilder;
@class DataBaseOrganization;


typedef DataBaseOrganization *(^CreateDataBaseOrganizationBlock)();

@interface DataBaseOrganization : NSObject
@property (nonatomic,strong) DataBaseBuilderParams * Params;

+ (CreateDataBaseOrganizationBlock)manager;

- (DataBaseBuilder *(^)())Builder;

@end

