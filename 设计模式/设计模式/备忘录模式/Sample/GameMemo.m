//
//  GameMemo.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GameMemo.h"

@implementation GameMemo

//数据库存储用的内容
+ (NSString *)jr_customTableName {
    return @"my_GameMemo_table";
}

+ (NSString *)jr_customPrimarykey {
    return @"GameMemoId";
}

- (id)jr_customPrimarykeyValue {
    return self.GameMemoId;
}


- (instancetype)initWithPoint:(NSInteger)point level:(NSInteger)level
{
    self = [super init];
    if (self) {
        self.point = point;
        self.level = level;
        self.GameMemoId = [NSString stringWithFormat:@"%ld",self.point+self.level];
        
    }
    return self;
}





@end
