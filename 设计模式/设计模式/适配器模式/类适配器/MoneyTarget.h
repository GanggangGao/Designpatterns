//
//  MoneyTarget.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#ifndef MoneyTarget_h
#define MoneyTarget_h



//类适配器
@protocol MoneyTarget <NSObject>

- (float)getRMB;

@end

#endif /* MoneyTarget_h */
