
//
//  TableViewBaseAdapter.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TableViewBaseAdapter.h"

@implementation TableViewBaseAdapter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return self;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *showUserInfoCellindentifier = @"showUserInfoCellindentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellindentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:showUserInfoCellindentifier];
    }
    
    return cell;
}




@end
