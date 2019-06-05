//
//  TotalJsonModel.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JsonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TotalJsonModel : NSObject

@property (nonatomic,assign) NSInteger total;

@property (nonatomic,copy) NSString *CurrentId;

@property (nonatomic,strong) NSArray<JsonModel*> *GameJsons;


@end

NS_ASSUME_NONNULL_END
