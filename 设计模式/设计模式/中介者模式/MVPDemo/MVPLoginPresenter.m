//
//  MVPLoginPresenter.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MVPLoginPresenter.h"


@interface MVPLoginPresenter()<HttpCallback>
@property (nonatomic,strong)MVPLoginView * view;
@property (nonatomic,strong)MVPLoginModel * model;
@end

@implementation MVPLoginPresenter


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.model = [[MVPLoginModel alloc]init];
    }
    return self;
}

- (void)attachView:(MVPLoginView *)view {
    self.view = view;
}

- (void)detachView{
    
    [self.view removeFromSuperview];
    self.view = nil;
    
}


- (void)LoginUser:(NSString *)userName password:(NSString *)password{
    
    [self.model LoginUser:userName password:password callback:self];
    
}

- (void)onLoginResult:(nonnull id)result {
    NSLog(@"更新v层的数据%@",result);
    [self.view onLoginResult:result];
    
}

@end
