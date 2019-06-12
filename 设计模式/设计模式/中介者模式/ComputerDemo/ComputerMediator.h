//
//  ComputerMediator.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#ifndef ComputerMediator_h
#define ComputerMediator_h

#import "ComputerColleague.h"

@class ComputerColleague;
@protocol ComputerMediator <NSObject>
- (void)changedColleague:(ComputerColleague *)colleague;

@end


#endif /* ComputerMediator_h */
