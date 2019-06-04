//
//  BaiduMapView.m
//  Dream_20180702_Factory_LBS_Demo
//
//  Created by Dream on 2018/7/2.
//  Copyright © 2018年 Tz. All rights reserved.
//

#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import "LocationProtocol.h"
@interface BaiduMapView ()<BMKMapViewDelegate>
@property (nonatomic, strong) BMKMapView *mapView;
@end

//具体百度地图
@implementation BaiduMapView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
         //初始化百度地图了
        self.mapView.frame = frame;

    }
    return self;
}



-(BMKMapView*)mapView{
    
    if(!_mapView){
        _mapView = [[BMKMapView alloc]init];
        _mapView.userTrackingMode = BMKUserTrackingModeNone; 
    }
    return  _mapView;
}


-(BMKMapView*)getView{
    return _mapView;
}

-(void)setShowUserLocation:(BOOL)isShowUserLocation{
    _mapView.showsUserLocation = isShowUserLocation;
}


- (MapViewType)getMapViewType{
    
    return MapViewTypeBaidu;
    
}


- (void)addAnnotation:(id<LocationProtocol>)location{
    
    //添加大头针
    BMKPointAnnotation *PointAnnotation = [[BMKPointAnnotation alloc]init];
    PointAnnotation.coordinate = [location getLocation].coordinate;
    PointAnnotation.title = @"连续定位";
    PointAnnotation.subtitle = [location getLocationId];
    [self.mapView addAnnotation:PointAnnotation];
    
}



- (void)viewWillAppear {
    [_mapView viewWillAppear];
}


- (void)viewWillDisappear {
    [_mapView viewWillDisappear];
}

@end
