//
//  ComputerSoundCard.h
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerColleague.h"

NS_ASSUME_NONNULL_BEGIN

@interface ComputerSoundCard : ComputerColleague
- (void)soundPlayData:(NSString *)data;
@end

NS_ASSUME_NONNULL_END
