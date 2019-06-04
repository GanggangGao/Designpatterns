//
//  ObserverVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ObserverVC.h"
#import "GGContreteObserver.h"
#import "GGContreteObservable.h"
@interface ObserverVC ()

@end

@implementation ObserverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //被观察者
    GGContreteObserver *server = [GGContreteObserver new];
    //观察者
    GGContreteObservable *servable = [GGContreteObservable new];
    
    
    [servable GG_AddObserver:server];
    
    [servable GG_NotificationObserver:@"你奶奶的腿儿的"];
    
    
    
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
