//
//  MVPLoginView.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MVPLoginView.h"

@implementation MVPLoginView

- (void)onLoginResult:(id)result{
    
    NSLog(@"%@的数据更新内容：%@",NSStringFromClass(self.class),result);
    
}
@end
