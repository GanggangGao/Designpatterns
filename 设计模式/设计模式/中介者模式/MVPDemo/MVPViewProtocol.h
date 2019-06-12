//
//  MVPViewProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>


//角色三：抽象同事   mvp对应V层
NS_ASSUME_NONNULL_BEGIN

@protocol MVPViewProtocol <NSObject>
- (void)onLoginResult:(id)result;
@end

NS_ASSUME_NONNULL_END
