//
//  CommandDanPinVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CommandDanPinVC.h"
#import "DanpinCommandManager.h"
@interface CommandDanPinVC ()
@property(nonatomic,strong)DanpinCommandManager *DanPinManager;
@end

@implementation CommandDanPinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self CreateDanPinManager];
    
}

- (void)CreateDanPinManager{
    DanPinRealization *Realization = [[DanPinRealization alloc]init];
    DanPinSwitchCommand *Switchoff = [[DanPinSwitchCommand alloc]init:Realization];
    DanPinSetTimeCommand *SetTime = [[DanPinSetTimeCommand alloc]init:Realization];
    DanPinSwitchModeCommand *SwitchMode = [[DanPinSwitchModeCommand alloc]init:Realization];
    
    self.DanPinManager = [[DanpinCommandManager alloc]initSwitch:Switchoff SetTime:SetTime SwitchMode:SwitchMode];
}

- (IBAction)OffClick:(id)sender {
    //关机
    [self.DanPinManager toOff];
}

- (IBAction)SetTimeClick:(id)sender {
    //设置间隔时间
    [self.DanPinManager setTime:10];
}
- (IBAction)SwitchModeClick:(id)sender {
    //设置检测模式
    [self.DanPinManager switchMode:DanPinDetectionModeContinuous];
}


@end
