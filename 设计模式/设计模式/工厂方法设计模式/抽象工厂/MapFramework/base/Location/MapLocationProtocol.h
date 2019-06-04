//
//  MapLocationProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MapLocationDelegateProtocol.h"
#import "LocationProtocol.h"
#import "MapViewProtocol.h"


typedef void (^MapLocatingCompletionBlock)(id<LocationProtocol> _Nullable location, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

//抽象产品协议
@protocol  MapLocationProtocol<NSObject>

//初始化定位的方法
- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview;


//监听
- (void)setLocationDelegate:(id<MapLocationDelegateProtocol>)delegate;
//开始
- (void)startLocation;
//停止
- (void)stopLocation;

//单次定位
- (BOOL)requestLocationWithReGeocode:(BOOL)withReGeocode withNetworkState:(BOOL)withNetWorkState completionBlock:(MapLocatingCompletionBlock _Nonnull)completionBlock;

@end

NS_ASSUME_NONNULL_END

