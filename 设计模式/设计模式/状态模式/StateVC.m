//
//  StateVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/6.
//  Copyright © 2019 3g. All rights reserved.
//

#import "StateVC.h"
#import "TVContext.h"
@interface StateVC ()

@end

@implementation StateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    TVContext *context = [[TVContext alloc]init];
    [context powerOn];
    [context preChannel];
    [context nextChannel];
    [context powerOff];
    [context turnUp];
    [context turnDown];
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
