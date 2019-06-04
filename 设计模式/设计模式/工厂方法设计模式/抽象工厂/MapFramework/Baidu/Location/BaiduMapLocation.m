//
//  BaiduMapLocation.m
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import "BaiduMapLocation.h"
#import "BaiduLocation.h"
/*
 有两种实现方式
 1.使用block实现
 2.协议实现
 */

@interface BMKLocationManagerDelegateImpl : NSObject<BMKLocationManagerDelegate>

@property(nonatomic,weak) id<MapLocationDelegateProtocol> delegateProtocol;
@property(nonatomic,strong) BMKUserLocation *userLocation;
@property (nonatomic, strong) BMKMapView *Mapview;
@end

//实现百度的
@implementation BMKLocationManagerDelegateImpl

- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview
{
    self = [super init];
    if (self) {
        self.Mapview = (BMKMapView *)[Mapview getView];
    }
    return self;
}



#pragma mark - BMKLocationManagerDelegate
/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didFailWithError:(NSError * _Nullable)error{
    
    NSLog(@"定位失败");
    [self.delegateProtocol LocationManagerdidFailWithError:error];
    
}


/**
 *  @brief 连续定位回调函数。
 *  @param manager 定位 BMKLocationManager 类。
 *  @param location 定位结果，参考BMKLocation。
 *  @param error 错误信息。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didUpdateLocation:(BMKLocation * _Nullable)location orError:(NSError * _Nullable)error{
    
    if (error) {
        NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
    }
    if (!location) {
        
        return;
    }
    
    self.userLocation.location = location.location;
    [self.Mapview updateLocationData:self.userLocation];
    [self.Mapview setCenterCoordinate:location.location.coordinate animated:YES];

    //实现该方法，否则定位图标不出现
    BaiduLocation *baodulocation = [[BaiduLocation alloc]initWithUserLocation:location];
    [self.delegateProtocol LocationdidUpdateLocation:baodulocation orError:error];
    
}

/**
 *  @brief 定位权限状态改变时回调函数
 *  @param manager 定位 BMKLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
    [self.delegateProtocol LocationManagerdidChangeAuthorizationStatus:status];
    
}


/**
 * @brief 该方法为BMKLocationManager提示需要设备校正回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例。
 */
- (BOOL)BMKLocationManagerShouldDisplayHeadingCalibration:(BMKLocationManager * _Nonnull)manager{
    

    return [self.delegateProtocol LocationManagerShouldDisplayHeadingCalibration];
    
}

/**
 * @brief 该方法为BMKLocationManager提供设备朝向的回调方法。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param heading 设备的朝向结果
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
          didUpdateHeading:(CLHeading * _Nullable)heading{
    
    [self.delegateProtocol LocationManagerdidUpdateHeading:heading];
    
}

/**
 * @brief 该方法为BMKLocationManager所在App系统网络状态改变的回调事件。
 * @param manager 提供该定位结果的BMKLocationManager类的实例
 * @param state 当前网络状态
 * @param error 错误信息
 */
- (void)BMKLocationManager:(BMKLocationManager * _Nonnull)manager
     didUpdateNetworkState:(BMKLocationNetworkState)state orError:(NSError * _Nullable)error{
    
    [self.delegateProtocol LocationManagerdidUpdateNetworkState:[self getLocationNetWorkStateformBMKLocationNetworkState:state] orError:error];
    
}

- (LocationNetworkState)getLocationNetWorkStateformBMKLocationNetworkState:(BMKLocationNetworkState)state{
    
    LocationNetworkState NetworkState = LocationNetworkStateUnknown;
    
    switch (state) {
        case BMKLocationNetworkStateUnknown:
        {
            NetworkState = LocationNetworkStateUnknown;
        }
            break;
        case BMKLocationNetworkStateWifi:
        {
            NetworkState = LocationNetworkStateWifi;
        }
            break;
        case BMKLocationNetworkStateWifiHotSpot:
        {
            NetworkState = LocationNetworkStateWifiHotSpot;
        }
            break;
        case BMKLocationNetworkStateMobile2G:
        {
            NetworkState = LocationNetworkStateMobile2G;
        }
            break;
        case BMKLocationNetworkStateMobile3G:
        {
            NetworkState = LocationNetworkStateMobile3G;
        }
            break;
        case BMKLocationNetworkStateMobile4G:
        {
            NetworkState = LocationNetworkStateMobile4G;
        }
            break;
            
        default:
            break;
    }
    
    return NetworkState;
    
}





- (BMKUserLocation *)userLocation {
    if (!_userLocation) {
        //初始化BMKUserLocation类的实例
        _userLocation = [[BMKUserLocation alloc] init];
    }
    return _userLocation;
}

@end


@interface BaiduMapLocation ()

@property (nonatomic, strong) BMKLocationManager *locationManager; //当前位置对象
@property (nonatomic, strong) BMKLocationManagerDelegateImpl* locDelegate;
@property (nonatomic, strong) BMKMapView *Mapview;
@end

//实现百度的
@implementation BaiduMapLocation


- (instancetype)initWithMapView:(id<MapViewProtocol>)Mapview
{
    self = [super init];
    if (self) {
        self.Mapview = (BMKMapView *)[Mapview getView];
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locDelegate = [[BMKLocationManagerDelegateImpl alloc]initWithMapView:Mapview];
    }
    return self;
}



#pragma mark - Lazy loading
- (BMKLocationManager *)locationManager {
    if (!_locationManager) {
        //初始化BMKLocationManager类的实例
        _locationManager = [[BMKLocationManager alloc] init];
        
        //基本参数
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;

        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        _locationManager.allowsBackgroundLocationUpdates = NO;
        _locationManager.locationTimeout = 10;
        _locationManager.reGeocodeTimeout = 10;

    }
    return _locationManager;
}




#pragma mark - MapLocationProtocol外部调用

//监听
- (void)setLocationDelegate:(id<MapLocationDelegateProtocol>)delegate{
    
    //z自定义实现类->MapMMapLocationDelegateProtocol
    self.locDelegate.delegateProtocol = delegate;
    //设置定位管理类实例的代理
    self.locationManager.delegate = self.locDelegate;
    
}
//开始
- (void)startLocation{
    //使用高德地图开始定位
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
}
//停止
- (void)stopLocation{
    //使用高德地图停止定位
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopUpdatingHeading];
    
}


//单次定位的操作
- (BOOL)requestLocationWithReGeocode:(BOOL)withReGeocode withNetworkState:(BOOL)withNetWorkState completionBlock:(MapLocatingCompletionBlock _Nonnull)completionBlock{
    
    __weak typeof(self)WeakSelf = self;
    return  [_locationManager requestLocationWithReGeocode:withReGeocode withNetworkState:withNetWorkState completionBlock:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
        
        //更新Map中的UI
        BMKUserLocation *usrlocation = [[BMKUserLocation alloc]init];
        usrlocation.location = location.location;
        
        [WeakSelf.Mapview updateLocationData:usrlocation];
        [WeakSelf.Mapview setCenterCoordinate:location.location.coordinate animated:YES];
        
        //返回自定义通用的定位数据
        BaiduLocation *baidu = [[BaiduLocation alloc]initWithUserLocation:location];
        completionBlock(baidu,error);
        
    }];
    
}



@end
