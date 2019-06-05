//
//  GameMemo.h
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//备忘录角色
@interface GameMemo : NSObject
//var point:Int
//var level:Int
@property (nonatomic,assign) NSInteger point;
@property (nonatomic,assign) NSInteger level;
@property (nonatomic,copy) NSString * GameMemoId;
- (instancetype)initWithPoint:(NSInteger)point level:(NSInteger)level;
@end

NS_ASSUME_NONNULL_END
