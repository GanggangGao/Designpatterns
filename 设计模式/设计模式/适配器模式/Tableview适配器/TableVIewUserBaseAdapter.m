//
//  TableVIewUserBaseAdapter.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TableVIewUserBaseAdapter.h"
#import "UserModel.h"
@implementation TableVIewUserBaseAdapter

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];
         [self.dataArray addObject:[[UserModel alloc]init:@"struggle" name:@"3g"]];

    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [super numberOfSectionsInTableView:tableView];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [super tableView:tableView numberOfRowsInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return [super tableView:tableView heightForHeaderInSection:section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    UserModel* model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.name;
    return cell;
    
}



@end
