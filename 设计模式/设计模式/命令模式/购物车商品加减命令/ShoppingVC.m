//
//  ShoppingVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ShoppingVC.h"
#import "ShoppingDynamicCommandManager.h"
@interface ShoppingVC ()
@property (weak, nonatomic) IBOutlet UITextField *MyTextField;
@property(strong,nonatomic)ShoppingDynamicCommandManager *Manager;
@end

@implementation ShoppingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.Manager = [[ShoppingDynamicCommandManager alloc]init:[ShoppingReceiver new]];
}

- (IBAction)AddShopping:(id)sender {
    [self.Manager increase:[NSNumber numberWithInteger:1]];
    
    self.MyTextField.text = [NSString stringWithFormat:@"%ld",self.Manager.Commodity._count];
}
- (IBAction)DeleteShopping:(id)sender {
    [self.Manager reduce:[NSNumber numberWithInteger:1]];
    self.MyTextField.text = [NSString stringWithFormat:@"%ld",self.Manager.Commodity._count];
}
- (IBAction)unDoClick:(id)sender {
    [self.Manager Undo];
    self.MyTextField.text = [NSString stringWithFormat:@"%ld",self.Manager.Commodity._count];
}

@end
