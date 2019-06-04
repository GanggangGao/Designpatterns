//
//  CompoundCommand.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CompoundCommand.h"

@interface CompoundCommand()
@property(nonatomic,strong)NSMutableArray *Commands;

@end

@implementation CompoundCommand
- (instancetype)init:(NSMutableArray *)Commands{
    self = [super init];
    if(self){
        self.Commands = Commands;
    }
    return self;
}

//在我的复合命令中，调用执行多个命令就叫做复合命令
-(void)execute{
    
    for (id<DanPinCommandProtocol> command in self.Commands) {
        [command execute];
    }
    
}


@end
