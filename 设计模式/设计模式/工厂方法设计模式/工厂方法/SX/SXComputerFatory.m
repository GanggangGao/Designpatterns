//
//  SXComputerFatory.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "SXComputerFatory.h"
#import "SXComputer.h"

//引用电脑就是依赖电脑
@implementation SXComputerFatory

-(id<ComputerProtocol>)getComputer{
    
    return [[SXComputer alloc]init];
}
@end
