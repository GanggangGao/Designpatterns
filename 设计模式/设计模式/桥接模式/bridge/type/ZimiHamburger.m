//
//  ZimiHamburger.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ZimiHamburger.h"

@implementation ZimiHamburger

-(void)MakeHamburger{
    
    NSLog(@"紫米煎饼,加%@,加%@",[self.EggSideDish AddSideDish],[self.SpicySticksSideDish AddSideDish]);
    
}

@end
