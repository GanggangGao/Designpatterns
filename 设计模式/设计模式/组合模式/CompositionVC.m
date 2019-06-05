//
//  CompositionVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CompositionVC.h"
#import "Composite.h"
#import "leaf.h"
@interface CompositionVC ()

@end

@implementation CompositionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    id<ComponentProtocol> Companydir = [[Composite alloc]initWithName:@"公司"];
    id<ComponentProtocol> Departmentdir = [[Composite alloc]initWithName:@"部门"];
    id<ComponentProtocol> CEOleaf = [[leaf alloc]initWithName:@"CEO"];
    id<ComponentProtocol> dir = [[Composite alloc]initWithName:@"nono"];
    [Companydir addChild:Departmentdir];
    [Companydir addChild:CEOleaf];
    [CEOleaf addChild:dir];
    
}


@end
