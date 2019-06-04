//
//  GaodeMapFactory.m
//  Dream_20180702_Factory_LBS_Demo
//
//  Created by Dream on 2018/7/2.
//  Copyright © 2018年 Tz. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "GaodeMapLocation.h"
@interface GaodeMapFactory ()

@end

@implementation GaodeMapFactory

- (instancetype)initWithAppKey:(NSString *)AppKey
{
    self = [super init];
    if (self) {
        [AMapServices sharedServices].apiKey = AppKey;
        [[AMapServices sharedServices] setEnableHTTPS:YES];
    }
    return self;
}


-(id<MapViewProtocol>)getMapViewWithFrame:(CGRect)frame{
    return [[GaodeMapView alloc] initWithFrame:frame];
}

- (id<MapLocationProtocol>)getMapLocationWithMapViewProtocol:(id<MapViewProtocol>)mapview {
    
    return [[GaodeMapLocation alloc]initWithMapView:mapview];
    
}


@end
