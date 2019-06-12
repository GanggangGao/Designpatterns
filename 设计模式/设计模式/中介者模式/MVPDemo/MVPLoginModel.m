//
//  MVPLoginModel.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MVPLoginModel.h"

@interface  MVPLoginModel()

@property (nonatomic,weak)id<HttpCallback> callback;

@end

@implementation MVPLoginModel

- (void)LoginUser:(NSString *)userName password:(NSString *)password callback:(id<HttpCallback>)callback{
    self.callback = callback;
    [self httpRequestUser:userName password:password];
}


- (void)httpRequestUser:(NSString *)userName password:(NSString *)password{
    NSLog(@"请求服务器获取数据");
    [self.callback onLoginResult:@"获取服务器的数据"];
}

@end
