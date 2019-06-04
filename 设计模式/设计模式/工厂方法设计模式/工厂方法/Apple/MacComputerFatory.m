//
//  MacComputerFatory.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MacComputerFatory.h"
#import "MacComputer.h"
@implementation MacComputerFatory
-(id<ComputerProtocol>)getComputer{
    
    return [[MacComputer alloc]init];
}
@end
