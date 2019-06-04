//
//  Platform.h
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Platform : NSObject
@property(nonatomic,copy)NSString *mapId;
@property(nonatomic,copy)NSString* isOpen;
@property(nonatomic,copy)NSString *factoryName;
@property(nonatomic,copy)NSString *appKey;
@end

NS_ASSUME_NONNULL_END
