//
//  TableViewBaseAdapter.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
//角色一：适配器 TableViewBaseAdapter
//代替viewcontroller
//特点一： 实现目标接口(协议) ->UI
@interface TableViewBaseAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>
//万能类型
@property(nonatomic,strong)NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
