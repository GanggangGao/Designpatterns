//
//  MapLocationDelegateProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationProtocol.h"
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSInteger, LocationNetworkState) {
    LocationNetworkStateUnknown = 0,    ///<网络状态未知
    LocationNetworkStateWifi,           ///<网络状态wifi
    LocationNetworkStateWifiHotSpot,          ///<网络状态连接WIFI移动热点
    LocationNetworkStateMobile2G,          ///<网络状态移动2G
    LocationNetworkStateMobile3G,          ///<网络状态移动3G
    LocationNetworkStateMobile4G        ///<网络状态移动4G
};

@protocol  MapLocationDelegateProtocol<NSObject>

- (void)LocationManagerdidFailWithError:(NSError * _Nullable)error;

- (void)LocationdidUpdateLocation:(id<LocationProtocol>  _Nullable)location orError:(NSError * _Nullable)error;

- (void)LocationManagerdidChangeAuthorizationStatus:(CLAuthorizationStatus)status;


- (BOOL)LocationManagerShouldDisplayHeadingCalibration;


- (void)LocationManagerdidUpdateHeading:(CLHeading * _Nullable)heading;

- (void)LocationManagerdidUpdateNetworkState:(LocationNetworkState)state orError:(NSError * _Nullable)error;

@end
