//
//  BuilderVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BuilderVC.h"
#import "DataBaseOrganization.h"
@interface BuilderVC ()

@end

@implementation BuilderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    DataBaseOrganization
        .manager()
        .Builder()
        .Name(@"Danpin")
        .Type(@"1")
        .BuildDanPin()
        .Print();
    
    
}



@end
