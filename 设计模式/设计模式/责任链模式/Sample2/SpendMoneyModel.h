//
//  SpendMenoryModel.h
//  设计模式
//
//  Created by zachary spark on 2019/6/7.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpendMoneyModel : NSObject

@property (nonatomic,assign) CGFloat money;
@property (nonatomic,copy)  NSString *things;
@property (nonatomic,copy) NSString *role;

- (instancetype)initWithMoney:(CGFloat)money things:(NSString*)things role:(NSString*)role;
@end

NS_ASSUME_NONNULL_END
