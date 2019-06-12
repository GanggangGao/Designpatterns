//
//  BridgeVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BridgeVC.h"
#import "AddEggSideDish.h"
#import "AddSpicySticksSideDish.h"
#import "ZimiHamburger.h"
#import "ZaliangHamburger.h"
@interface BridgeVC ()

@end

@implementation BridgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    AddEggSideDish *egg = [[AddEggSideDish alloc]init];
    AddSpicySticksSideDish *spicysticks = [[AddSpicySticksSideDish alloc]
                                           init];
    ZimiHamburger *zimi = [[ZimiHamburger alloc]initWithSideDish:egg SpicySticks:spicysticks];
    [zimi MakeHamburger];
    
    
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
