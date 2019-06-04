//
//  LicensePlateNumber.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LicensePlateNumber : NSObject<NSCopying>

@property (nonatomic,copy)NSString *Id;

- (instancetype)initWithID:(NSString *)Id;

@end

NS_ASSUME_NONNULL_END
