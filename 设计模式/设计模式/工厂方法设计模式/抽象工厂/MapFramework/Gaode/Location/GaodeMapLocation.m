//
//  GaodeMapLocation.m
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import "GaodeMapLocation.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import <MAMapKit/MAMapKit.h>
#import "GaodeLocation.h"


@interface AMapLocationManagerDelegateImpl : NSObject<AMapLocationManagerDelegate>

@property(nonatomic,weak) id<MapLocationDelegateProtocol> delegateProtocol;
@property(nonatomic,strong) GaodeLocation *userLocation;
@property(nonatomic,strong) MAMapView *Mapview;
@end

//实现百度的
@implementation AMapLocationManagerDelegateImpl

- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview
{
    self = [super init];
    if (self) {
        self.Mapview = (MAMapView *)[Mapview getView];
    }
    return self;
}



#pragma mark - MapLocationDelegateProtocol

/**
 *  @brief 当plist配置NSLocationAlwaysUsageDescription或者NSLocationAlwaysAndWhenInUseUsageDescription，并且[CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined，会调用代理的此方法。
 此方法实现调用申请后台权限API即可：[locationManager requestAlwaysAuthorization](必须调用,不然无法正常获取定位权限)
 *  @param manager 定位 AMapLocationManager 类。
 *  @param locationManager  需要申请后台定位权限的locationManager。
 *  @since 2.6.2
 */
- (void)amapLocationManager:(AMapLocationManager *)manager doRequireLocationAuth:(CLLocationManager*)locationManager{
    
    [locationManager requestAlwaysAuthorization];
    
}

/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error{
    
    [self.delegateProtocol LocationManagerdidFailWithError:error];
    
}

/**
 *  @brief 连续定位回调函数.注意：如果实现了本方法，则定位信息不会通过amapLocationManager:didUpdateLocation:方法回调。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 *  @param reGeocode 逆地理信息。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode{
    

    //更新MapViewUI
    [self.Mapview setCenterCoordinate:location.coordinate animated:YES];
    
    //回调
    self.userLocation = [[GaodeLocation alloc]initWithLocation:location AMapReGeocode:reGeocode];
    [self.delegateProtocol LocationdidUpdateLocation:self.userLocation orError:nil];
    
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    [self.delegateProtocol LocationManagerdidChangeAuthorizationStatus:status];
    
}

/**
 *  @brief 是否显示设备朝向校准
 *  @param manager 定位 AMapLocationManager 类。
 *  @return 是否显示设备朝向校准
 */
- (BOOL)amapLocationManagerShouldDisplayHeadingCalibration:(AMapLocationManager *)manager{
    
    return [self.delegateProtocol LocationManagerShouldDisplayHeadingCalibration];
    
}

/**
 *  @brief 设备方向改变时回调函数
 *  @param manager 定位 AMapLocationManager 类。
 *  @param newHeading 设备朝向。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
}

@end


@interface  GaodeMapLocation()

@property (nonatomic,strong) AMapLocationManager *locationManager;
@property (nonatomic,strong) AMapLocationManagerDelegateImpl * delegateProtocol;
@property (nonatomic,strong) MAMapView *Mapview;
@end

@implementation GaodeMapLocation


- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview{
    
    self = [super init];
    if(self){
        self.Mapview = (MAMapView *)[Mapview getView];
        self.delegateProtocol = [[AMapLocationManagerDelegateImpl alloc]initWithMapView:Mapview];
        self.locationManager = [[AMapLocationManager alloc] init];
        // 带逆地理信息的一次定位（返回坐标和地址信息）
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        //   定位超时时间，最低2s，此处设置为2s
        self.locationManager.locationTimeout =2;
        //   逆地理请求超时时间，最低2s，此处设置为2s
        self.locationManager.reGeocodeTimeout = 2;
    }
    
    return self;
    
}

//监听
- (void)setLocationDelegate:(id<MapLocationDelegateProtocol>)delegate{
    //自定义实现类->MapMMapLocationDelegateProtocol
    self.locationManager.delegate = self.delegateProtocol;
    self.delegateProtocol.delegateProtocol = delegate;
    
    
}
//开始
- (void)startLocation{
    //使用高德地图开始定位
    [self.locationManager startUpdatingLocation];
    [self.locationManager stopUpdatingHeading];
    
}
//停止
- (void)stopLocation{
    //使用高德地图停止定位
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopUpdatingHeading];
    
}

- (BOOL)requestLocationWithReGeocode:(BOOL)withReGeocode withNetworkState:(BOOL)withNetWorkState completionBlock:(MapLocatingCompletionBlock _Nonnull)completionBlock {
    
    // 带逆地理（返回坐标和地址信息）。将下面代码中的 YES 改成 NO ，则不会返回地址信息。
    return [self.locationManager requestLocationWithReGeocode:withReGeocode completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        
        [self.Mapview setCenterCoordinate:location.coordinate animated:YES];
        
        id<LocationProtocol> gaode = [[GaodeLocation alloc]initWithLocation:location AMapReGeocode:regeocode];
        completionBlock(gaode,error);
        
        if (regeocode)
        {
            NSLog(@"reGeocode:%@", regeocode);
        }
    }];
    
    
}



@end
