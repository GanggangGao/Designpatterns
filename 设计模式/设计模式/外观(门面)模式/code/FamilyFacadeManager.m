//
//  FamilyFacadeManager.m
//  设计模式
//
//  Created by zachary spark on 2019/6/10.
//  Copyright © 2019 3g. All rights reserved.
//

#import "FamilyFacadeManager.h"
#import "TVManager.h"
#import "ComputerManager.h"
#import "XboxoneManager.h"


@interface FamilyFacadeManager()
@property (nonatomic,strong)TVManager *TV;
@property (nonatomic,strong)ComputerManager *Computer;
@property (nonatomic,strong)XboxoneManager *Xboxone;
@end

@implementation FamilyFacadeManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.TV = [[TVManager alloc]init];
        self.Computer = [[ComputerManager alloc]init];
        self.Xboxone = [[XboxoneManager alloc]init];
    }
    return self;
}

- (void)openTVPlayMovie{
    
    [self.TV openTV];
    [self.TV SeeMovie];
    
}
- (void)openComputerDownloadMovie{
    
    [self.Computer openComputer];
    [self.Computer DownloadMovie];
}
- (void)openXboxonePlayGame{
    
    [self.Xboxone openXboxone];
    [self.Xboxone PlayGame];
    
}

@end
