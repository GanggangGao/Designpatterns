//
//  MVPLoginModel.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>




NS_ASSUME_NONNULL_BEGIN


@protocol HttpCallback <NSObject>

- (void)onLoginResult:(id)result;

@end


@interface MVPLoginModel : NSObject
- (void)LoginUser:(NSString *)userName password:(NSString *)password callback:(id<HttpCallback>)callback;
@end

NS_ASSUME_NONNULL_END
