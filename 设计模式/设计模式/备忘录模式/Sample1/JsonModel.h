//
//  JsonModel.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonModel : NSObject

@property (nonatomic, assign) NSInteger point; //分数

@property (nonatomic, assign) NSInteger level; //等级

@property (nonatomic, copy) NSString * JsonId; //当前game对象的标示

- (instancetype)initWithPoint:(NSInteger)point level:(NSInteger)level;

@end

NS_ASSUME_NONNULL_END
