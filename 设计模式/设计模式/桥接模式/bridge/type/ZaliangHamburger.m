//
//  ZaliangHamburger.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ZaliangHamburger.h"

@implementation ZaliangHamburger


-(void)MakeHamburger{
    
    NSLog(@"杂粮煎饼,加%@,加%@",[self.EggSideDish AddSideDish],[self.SpicySticksSideDish AddSideDish]);
    
}

@end
