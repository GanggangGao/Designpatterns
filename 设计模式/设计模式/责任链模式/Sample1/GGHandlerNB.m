//
//  GGHandlerNB.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GGHandlerNB.h"

@implementation GGHandlerNB


- (void)HandlerRequest:(GGRequest*)request{
    if([request getlevel] == [self getlevel]){
        [self Handler:request];
    }else{
        if(self.nextHandler != nil){
            [self.nextHandler HandlerRequest:request];
        }else{
            NSLog(@"没有找到方法");
        }
    }
    
    
}

- (NSInteger)getlevel{
    return 0;
}

- (void)Handler:(GGRequest*)request{
    
    
    
}


@end
