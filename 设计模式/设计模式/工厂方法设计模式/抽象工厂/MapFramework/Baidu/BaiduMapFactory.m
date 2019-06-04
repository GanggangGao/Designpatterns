//
//  BaiduMapFactory.m
//  Dream_20180702_Factory_LBS_Demo
//
//  Created by Dream on 2018/7/2.
//  Copyright © 2018年 Tz. All rights reserved.
//

#import "BaiduMapFactory.h"


@interface BaiduMapFactory ()<BMKLocationAuthDelegate,BMKGeneralDelegate>
@property(nonatomic,strong)BMKMapManager *mapManager;

@end

@implementation BaiduMapFactory

- (instancetype)initWithAppKey:(NSString *)AppKey
{
    self = [super init];
    if (self) {
        //地图的初始化工作完成
        // 要使用百度地图，请先启动BaiduMapManager
        _mapManager = [[BMKMapManager alloc] init];
        // 如果要关注网络及授权验证事件，请设定generalDelegate参数
        [[BMKLocationAuth sharedInstance] checkPermisionWithKey:AppKey authDelegate:self];
        
        //启动引擎并设置AK并设置delegate
        BOOL result = [_mapManager start:AppKey generalDelegate:self];
        if (!result) {
            NSLog(@"启动引擎失败");
        }
        
    }
    return self;
}

#pragma  mark -- BMKLocationAuthDelegate

/**
 *@brief 返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKLocationAuthErrorCode
 */
- (void)onCheckPermissionState:(BMKLocationAuthErrorCode)iError{
    
    
    
}


#pragma mark -- BMKGeneralDelegate
/**
 联网结果回调
 
 @param iError 联网结果错误码信息，0代表联网成功
 */
- (void)onGetNetworkState:(int)iError {
    
    if (0 == iError) {
        NSLog(@"联网成功");
    } else {
        NSLog(@"联网失败：%d", iError);
    }
}

/**
 鉴权结果回调
 
 @param iError 鉴权结果错误码信息，0代表鉴权成功
 */
- (void)onGetPermissionState:(int)iError {
    if (0 == iError) {
        NSLog(@"授权成功");
    } else {
        NSLog(@"授权失败：%d", iError);
    }
}




-(id<MapViewProtocol>)getMapViewWithFrame:(CGRect)frame{
    
    return [[BaiduMapView alloc] initWithFrame:frame];
    
    
}

//z增加流水线
-(id<MapLocationProtocol>)getMapLocationWithMapViewProtocol:(id<MapViewProtocol>)mapview{

    return [[BaiduMapLocation alloc]initWithMapView:mapview];

}

@end
