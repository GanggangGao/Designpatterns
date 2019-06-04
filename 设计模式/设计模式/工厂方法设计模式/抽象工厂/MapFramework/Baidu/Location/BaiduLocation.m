//
//  BaiduLocation.m
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BaiduLocation.h"

@interface BaiduLocation ()<BMKLocationManagerDelegate>

@property (nonatomic, strong) BMKLocation *Location; //当前位置对象

@end

@implementation BaiduLocation

- (instancetype)initWithUserLocation:(BMKLocation *)Location
{
    self = [super init];
    if (self) {
        self.Location = Location;
    }
    return self;
}



- (CLLocation *)getLocation{
    
    return self.Location.location;
}


- (NSString *)getLocationId{
    
    return self.Location.locationID;
}



@end
