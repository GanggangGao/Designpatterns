//
//  UserDelegateVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/12.
//  Copyright © 2019 3g. All rights reserved.
//

#import "UserDelegateVC.h"
#import "UserLogin.h"
#import "UserProxy.h"
@interface UserDelegateVC ()

@end

@implementation UserDelegateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UserLogin *login = [[UserLogin alloc]init];
    UserProxy *proxy = [[UserProxy alloc]initWithUser:login];
    [proxy UserLogin];
    
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
