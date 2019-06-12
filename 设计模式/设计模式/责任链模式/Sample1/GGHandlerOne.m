//
//  GGHandlerOne.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GGHandlerOne.h"

@implementation GGHandlerOne

- (NSInteger)getlevel{
    
    return 1;
}

- (void)Handler:(GGRequest*)request{
    NSLog(@"请求者:%@：调用了%@的逻辑",NSStringFromClass(request.class),NSStringFromClass(self.class));
    [request showContent];
}

@end
