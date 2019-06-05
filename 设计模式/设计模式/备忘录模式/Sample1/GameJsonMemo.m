//
//  GameJsonMemo.m
//  设计模式
//
//  Created by zachary spark on 2019/6/5.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GameJsonMemo.h"
#import "GameJsonOriginator.h"
#import "TotalJsonModel.h"
#import <YYModel.h>
@interface GameJsonMemo()

//将状态以NSString的形式进行保存
@property (nonatomic,copy) NSString * jsonStr;

@end

@implementation GameJsonMemo


- (instancetype)initWithOriginator:(GameJsonOriginator *)Originator
{
    self = [super init];
    if (self) {
        self.jsonStr = [self toString:Originator];
    }
    return self;
}

- (NSString *)toString:(GameJsonOriginator *)Originator{
    
    TotalJsonModel *TotalModel = [[TotalJsonModel alloc]init];
    TotalModel.total = Originator.total;
    TotalModel.CurrentId = Originator.CurrentId;
    TotalModel.GameJsons = [[NSArray alloc]initWithArray:Originator.GameJsons];
    
    NSString *str = [TotalModel yy_modelToJSONString];
    NSLog(@"%@",str);
    return str;
    
}


- (void)Restore:(GameJsonOriginator *)Originator{
    
    TotalJsonModel *TotalModel = [TotalJsonModel yy_modelWithJSON:self.jsonStr];
    Originator.total = TotalModel.total;
    Originator.CurrentId = TotalModel.CurrentId;
    TotalModel.GameJsons = [[NSMutableArray alloc]initWithArray:TotalModel.GameJsons];
    
}



@end
