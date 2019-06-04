//
//  ComputerFatoryProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ComputerProtocol.h"


//判断关系，是谁引用了谁
//引用谁就是依赖谁

//电脑工厂的标准
@protocol ComputerFatoryProtocol<NSObject>

//电脑标准
-(id<ComputerProtocol>)getComputer;


@end
