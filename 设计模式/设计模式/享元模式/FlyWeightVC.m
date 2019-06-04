//
//  FlyWeightVC.m
//  设计模式
//
//  Created by zachary spark on 2019/6/4.
//  Copyright © 2019 3g. All rights reserved.
//

#import "FlyWeightVC.h"
#import "TicketFactory.h"
@interface FlyWeightVC ()

@end

@implementation FlyWeightVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    id<TrainTicketProtocol> ticket = [TicketFactory Ticketfrom:@"成都" to:@"北京"];
    [ticket showTicketInfo:@"二等座"];
    
}

-(void)dealloc{
    
    [TicketFactory Clean];
    
}



@end
