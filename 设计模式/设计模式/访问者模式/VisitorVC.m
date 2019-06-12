//
//  VisitorVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "VisitorVC.h"
#import "BusinessReport.h"
#import "BossVisitor.h"
@interface VisitorVC ()

@end

@implementation VisitorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    BusinessReport *business = [[BusinessReport alloc]init];
    [business ShowReport:[[BossVisitor alloc]initName:@"高擎天"]];
    
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
