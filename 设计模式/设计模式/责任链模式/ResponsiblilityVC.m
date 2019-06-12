//
//  ResponsiblilityVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ResponsiblilityVC.h"
#import "HandlerOne.h"
#import "HandlerTwo.h"
#import "GGHandlerOne.h"
#import "GGHandlerTwo.h"
#import "GGRequestOne.h"
#import "GGRequestTwo.h"
#import "FamilySon.h"
#import "FamilyFather.h"
#import "FamilyMother.h"
@interface ResponsiblilityVC ()

@end

@implementation ResponsiblilityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    //简单责任链设计模式
//    HandlerOne *one = [[HandlerOne alloc]init];
//    HandlerTwo *two = [[HandlerTwo alloc]init];
//    one.nextHandler = two;
//    [one HandlerConditionlevel:1];
    

    //比较复杂的责任链设计模式
//    GGRequestOne *requestone = [[GGRequestOne alloc]init];
////    GGRequestTwo *requesttwo = [[GGRequestTwo alloc]init];
//
//    GGHandlerOne *handlerone = [[GGHandlerOne alloc]init];
//    GGHandlerTwo *handlertwo = [[GGHandlerTwo alloc]init];
//    handlerone.nextHandler = handlertwo;
//    [handlerone HandlerRequest:requesttwo];
    
    //家庭花钱例子
    FamilySon *son = [[FamilySon alloc]init];
    FamilyFather *father = [[FamilyFather alloc]init];
    FamilyMother *mother = [[FamilyMother alloc]init];
    son.nextFamilyMember = father;
    father.nextFamilyMember = mother;
    
    SpendMoneyModel *model = [[SpendMoneyModel alloc]initWithMoney:3600 things:@"iPad" role:@"看视频"];
    
    [son ReportSpendMenory:model];
    
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
