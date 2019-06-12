//
//  DecoratorVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DecoratorVC.h"
#import "BMWCar.h"
#import "HighConfig.h"
#import "LowConfig.h"
@interface DecoratorVC ()

@end

@implementation DecoratorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    BMWCar *car = [[BMWCar alloc]init];
    [car Configuration];
    
    //高配版本
    HighConfig *high = [[HighConfig alloc]initWithCar:car];
    [high AddConfiguration];
    
    //低配版本
    LowConfig *low = [[LowConfig alloc]initWithCar:car];
    [low AddConfiguration];
    
    
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
