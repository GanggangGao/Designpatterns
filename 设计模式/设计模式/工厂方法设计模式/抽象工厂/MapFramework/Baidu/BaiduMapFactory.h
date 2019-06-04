//
//  BaiduMapFactory.h
//  Dream_20180702_Factory_LBS_Demo
//
//  Created by Dream on 2018/7/2.
//  Copyright © 2018年 Tz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapFactoryProtocol.h"
#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BMKLocationkit/BMKLocationComponent.h>
#import "BaiduMapLocation.h"
@interface BaiduMapFactory : NSObject<MapFactoryProtocol>
@end
