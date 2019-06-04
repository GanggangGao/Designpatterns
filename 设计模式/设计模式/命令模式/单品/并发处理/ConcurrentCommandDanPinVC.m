//
//  ConcurrentCommandDanPinVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ConcurrentCommandDanPinVC.h"
#import "ConcurrentCommandManager.h"
@interface ConcurrentCommandDanPinVC ()
@property(nonatomic,strong)ConcurrentCommandManager *manager;
@end

@implementation ConcurrentCommandDanPinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.manager = [[ConcurrentCommandManager alloc]init:[[DanPinRealization alloc]init]];
}
- (IBAction)OffClick:(id)sender {
    [self.manager toOff];
}

- (IBAction)SetTimeClick:(id)sender {
    [self.manager setTime:10];
}
- (IBAction)DetectionModeClick:(id)sender {
    [self.manager switchMode:DanPinDetectionModeContinuous];
}
- (IBAction)UndoClick:(UIButton *)sender {
    [self.manager Undo];
}
- (IBAction)UndoAllClick:(id)sender {
    [self.manager UndoAll];
}

@end
