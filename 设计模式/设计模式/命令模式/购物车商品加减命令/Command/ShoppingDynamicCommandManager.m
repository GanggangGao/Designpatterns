//
//  ShoppingDynamicCommandManager.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ShoppingDynamicCommandManager.h"
@interface ShoppingDynamicCommandManager()
@property(nonatomic,strong)NSMutableArray *commands;
@end

@implementation ShoppingDynamicCommandManager


-(instancetype)init:(ShoppingReceiver*)Commodity{
    
    self = [super init];
    if(self){
        self.Commodity = Commodity;
        self.commands = [[NSMutableArray alloc]init];
    }
    return self;
    
}


- (void)AddCommand:(NSString *)MethodName withObject:(id)data{
    
    //获取到方法对象
    SEL Method = NSSelectorFromString(MethodName);
    [self.commands addObject:[ShoppingDynamicCommand CreateCommand:self.Commodity withObject:data block:^(ShoppingReceiver *Commodity,id data) {
        //执行回调
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [Commodity performSelector:Method withObject:data];
#pragma clang diagnostic pop
    } ]];
    
    
}

-(void)increase:(id)value{
    
    [self.Commodity increase:value];
    [self AddCommand:@"reduce:" withObject:value];
    
}

-(void)reduce:(id)value{
    [self.Commodity reduce:value];
    [self AddCommand:@"increase:" withObject:value];
}

-(void)Undo{
    
    if(self.commands.count > 0){
        
        [[self.commands lastObject] execute];
        
        [self.commands removeLastObject];
    }
    
}

@end
