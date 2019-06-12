//
//  ChineseHamburger.h
//  设计模式
//
//  Created by zachary spark on 2019/6/9.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChineseHamburgerSideDish.h"
NS_ASSUME_NONNULL_BEGIN

@interface ChineseHamburger : NSObject
@property (nonatomic,strong)ChineseHamburgerSideDish *EggSideDish;
@property (nonatomic,strong)ChineseHamburgerSideDish *SpicySticksSideDish;
- (instancetype)initWithSideDish:(ChineseHamburgerSideDish *)eggSideDish SpicySticks:(ChineseHamburgerSideDish *)SpicySticks;
- (void)MakeHamburger;

@end

NS_ASSUME_NONNULL_END
