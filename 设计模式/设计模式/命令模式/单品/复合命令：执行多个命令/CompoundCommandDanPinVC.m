//
//  CompoundCommandDanPinVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CompoundCommandDanPinVC.h"
#import "CompoundCommandManager.h"
@interface CompoundCommandDanPinVC ()
@property(nonatomic,strong)CompoundCommandManager *Manager;
@end

@implementation CompoundCommandDanPinVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.Manager = [[CompoundCommandManager alloc]init:[[DanPinRealization alloc]init]];
    
}
- (IBAction)CompoundCommandClick:(id)sender {
    [self.Manager SetTimeAndSwitchMode:@[@10,@1]];
}
- (IBAction)UndoClick:(id)sender {
    [self.Manager Undo];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
