//
//  GaodeLocation.h
//  设计模式
//
//  Created by zachary spark on 2019/5/18.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationProtocol.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface GaodeLocation : NSObject<LocationProtocol>
- (instancetype)initWithLocation:(CLLocation *)Location AMapReGeocode:(AMapLocationReGeocode *)ReGeocode;
@end

NS_ASSUME_NONNULL_END
