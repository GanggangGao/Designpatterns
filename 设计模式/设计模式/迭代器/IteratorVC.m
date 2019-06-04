//
//  IteratorVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/2.
//  Copyright © 2019 3g. All rights reserved.
//

#import "IteratorVC.h"
#import "CusEnumerator.h"
#import "ConcreteAggregrate.h"
@interface IteratorVC ()

@end

@implementation IteratorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //系统第一种迭代器方式  iOS 2.0
    NSArray *oneArray = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    CusEnumerator *Enumerator = (CusEnumerator*)[oneArray objectEnumerator];
    while (NSString *Str = [Enumerator nextObject]) {
        NSLog(@"%@",Str);
    };
    //系统第二种迭代器方式 iOS 4.0
    NSArray *twoArray = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    [twoArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
    
    //自定义迭代器
    ConcreteAggregrate *aggregrate = [[ConcreteAggregrate alloc]init];
    [aggregrate AddItem:@"Struggle3g"];
    [aggregrate AddItem:@"iOS开发者"];
    [aggregrate AddItem:@"开发产品"];
    id<IteratorProtocol> iterator =  [aggregrate iterator];
    
    while ([iterator hasNext]) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@",[iterator next]]);
    }
    
    
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
