

//
//  MediatorVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MediatorVC.h"
#import "MacComputerMediator.h"

#import "MVPLoginPresenter.h"
@interface MediatorVC ()

@end

@implementation MediatorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //案例一
//    MacComputerMediator *mac = [[MacComputerMediator alloc]init];
//    [mac setCpu:[[ComputerCPU alloc]initWithMediator:mac]];
//    [mac setDisplaycard:[[ComputerDispalyCard alloc]initWithMediator:mac]];
//    [mac setSoundcard:[[ComputerSoundCard alloc]initWithMediator:mac]];
//    [mac setCddevice:[[ComputerCDDevice alloc]initWithMediator:mac]];
//    [mac.cddevice load];
    
    //案例二
    MVPLoginView *loginview = [[MVPLoginView alloc]init];
    [self.view addSubview:loginview];
    MVPLoginPresenter *presenter = [[MVPLoginPresenter alloc]init];
    [presenter attachView:loginview];
    [presenter LoginUser:@"12345" password:@"6789"];
    

}


@end
