//
//  UserModel.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *name;

- (instancetype)init:(NSString *)title name:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
