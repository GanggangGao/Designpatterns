//
//  CarModel.h
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CarModel : NSObject<NSCopying>

@property (nonatomic,copy)NSString *Nmae;
@property (nonatomic,copy)NSString *Des;


- (instancetype)initWithName:(NSString *)name des:(NSString *)des;

@end

NS_ASSUME_NONNULL_END
