//
//  MVPPresenterProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPLoginView.h"

//角色一：抽象中介者  mvp对应p层
NS_ASSUME_NONNULL_BEGIN

@protocol MVPPresenterProtocol <NSObject>

- (void)attachView:(MVPLoginView *)view;
- (void)detachView;

@end

NS_ASSUME_NONNULL_END
