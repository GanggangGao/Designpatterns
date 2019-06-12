//
//  ParserVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ParserVC.h"
#import "ParserContext.h"
@interface ParserVC ()

@end

@implementation ParserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ParserContext *context = [[ParserContext alloc]init];
    CGFloat num = [context interpretorExpression:@"10 + 20 + 30 - 50 + 60"];
    NSLog(@"%f",num);
    
}


@end
