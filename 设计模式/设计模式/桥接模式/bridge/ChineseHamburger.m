//
//  ChineseHamburger.m
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ChineseHamburger.h"

@interface ChineseHamburger()



@end

@implementation ChineseHamburger

- (instancetype)initWithSideDish:(ChineseHamburgerSideDish *)eggSideDish SpicySticks:(ChineseHamburgerSideDish *)SpicySticks
{
    self = [super init];
    if (self) {
        self.EggSideDish = eggSideDish;
        self.SpicySticksSideDish = SpicySticks;
    }
    return self;
}


- (void)MakeHamburger{
    
}

@end
