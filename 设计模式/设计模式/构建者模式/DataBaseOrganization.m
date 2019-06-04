//
//  DataBaseOrganization.m
//  设计模式
//
//  Created by zachary spark on 2019/5/26.
//  Copyright © 2019 3g. All rights reserved.
//

#import "DataBaseOrganization.h"


@implementation DataBaseOrganization

//角色一  组织管理
+ (CreateDataBaseOrganizationBlock)manager{
    
    return ^DataBaseOrganization* (){
        return [DataBaseOrganization new];
    };
    
}


- (DataBaseBuilder* (^)())Builder{
    
    return ^DataBaseBuilder* () {
        return [[DataBaseBuilder alloc]init];
    };
    
}


@end
