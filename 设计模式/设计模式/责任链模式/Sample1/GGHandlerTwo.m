//
//  GGHandlerTwo.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GGHandlerTwo.h"

@implementation GGHandlerTwo



- (NSInteger)getlevel{
    return 2;
}

- (void)Handler:(GGRequest*)request{
    
    NSLog(@"请求者:%@：调用了%@的逻辑",NSStringFromClass(request.class),NSStringFromClass(self.class));
    [request showContent];
}



@end
