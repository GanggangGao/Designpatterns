//
//  MVPLoginPresenter.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPPresenterProtocol.h"
#import "MVPLoginModel.h"


//角色二：具体中介者 

NS_ASSUME_NONNULL_BEGIN

@interface MVPLoginPresenter : NSObject<MVPPresenterProtocol>
- (void)LoginUser:(NSString *)userName password:(NSString *)password;
@end

NS_ASSUME_NONNULL_END
