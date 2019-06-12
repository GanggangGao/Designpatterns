//
//  TVContext.m
//  设计模式
//
//  Created by zachary spark on 2019/6/6.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TVContext.h"
#import "OnState.h"
#import "OffState.h"
@interface TVContext ()

@property (nonatomic,strong)id<StateProtocol> state;

@end

@implementation TVContext


- (void)powerOn{
    
    self.state = [[OnState alloc]init];
    
}

- (void)powerOff{
    self.state = [[OffState alloc]init];
}


- (void)nextChannel{
    [self.state nextChannel];
}
- (void)preChannel{
    [self.state preChannel];
}
- (void)turnUp{
   [self.state turnUp];
}
- (void)turnDown{
    [self.state turnDown];
}



@end
