//
//  GaodeLocation.m
//  设计模式
//
//  Created by zachary spark on 2019/5/18.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GaodeLocation.h"

@interface  GaodeLocation()
@property (nonatomic,strong) CLLocation *Location;
@property (nonatomic,strong) AMapLocationReGeocode *ReGeocode;
@end

@implementation GaodeLocation

- (instancetype)initWithLocation:(CLLocation *)Location AMapReGeocode:(AMapLocationReGeocode *)ReGeocode{
    
    self = [super init];
    if(self){
        self.Location  = Location;
        self.ReGeocode = ReGeocode;
    }
    return self;
}


- (CLLocation *)getLocation {
    
    return self.Location;
    
}

- (NSString *)getLocationId {
    
    return self.ReGeocode.formattedAddress;
    
}

@end
