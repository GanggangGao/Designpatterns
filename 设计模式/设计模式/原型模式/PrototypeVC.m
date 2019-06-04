//
//  PrototypeVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "PrototypeVC.h"
#import "CarModel.h"
#import "CarModel1.h"
#import "CarModel2.h"
@interface PrototypeVC ()

@end

@implementation PrototypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //1 系统克隆协议方法
//    CarModel *car = [[CarModel alloc]initWithName:@"兰博基尼" des:@"土豪开的车"];
//    CarModel *copycar = [car copy];
//    copycar.Nmae = @"劳斯莱斯";
//    copycar.Des = @"听说有个纯金的";
//    NSLog(@"car.name = %@, car.des = %@",car.Nmae,car.Des);
//    NSLog(@"copycar.name = %@, copycar.des = %@",copycar.Nmae,copycar.Des);
    
    //2 自定义克隆协议方法
//    CarModel1 *car = [[CarModel1 alloc]initWithName:@"兰博基尼" des:@"土豪开的车"];
//    CarModel1 *copycar = [car Clone];
//    copycar.Nmae = @"劳斯莱斯";
//    copycar.Des = @"听说有个纯金的";
//    NSLog(@"car.name = %@, car.des = %@",car.Nmae,car.Des);
//    NSLog(@"copycar.name = %@, copycar.des = %@",copycar.Nmae,copycar.Des);
    
//    //3 浅拷贝 浅拷贝只是拷贝了指针
//    CarModel1 *car = [[CarModel1 alloc]initWithName:@"兰博基尼" des:@"土豪开的车"];
//    CarModel1 *copycar = car;
//    copycar.Nmae = @"劳斯莱斯";
//    copycar.Des = @"听说有个纯金的";
//    NSLog(@"car.name = %@, car.des = %@",car.Nmae,car.Des);
//    NSLog(@"copycar.name = %@, copycar.des = %@",copycar.Nmae,copycar.Des);
    
    //4 原型模式
    LicensePlateNumber *Number =  [[LicensePlateNumber alloc]initWithID:@"dp506u"];
    CarModel2 *car = [[CarModel2 alloc]initWithName:@"兰博基尼" des:@"土豪开的车" Number:Number];
    CarModel2 *copycar = [car copy];
    copycar.Nmae = @"劳斯莱斯";
    copycar.Des = @"听说有个纯金的";
    Number.Id = @"11111";
    NSLog(@"car.name = %@, car.des = %@, id = %@",car.Nmae,car.Des,car.Number.Id);
    NSLog(@"copycar.name = %@, copycar.des = %@, id = %@",copycar.Nmae,copycar.Des,copycar.Number.Id);
    
}



@end
