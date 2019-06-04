//
//  BaiduMapLocation.h
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapLocationProtocol.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import <BMKLocationkit/BMKLocationComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaiduMapLocation : NSObject<MapLocationProtocol>
- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview;
@end

NS_ASSUME_NONNULL_END
