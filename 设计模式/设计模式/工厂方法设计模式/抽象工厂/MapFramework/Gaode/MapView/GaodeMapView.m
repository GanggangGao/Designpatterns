//
//  GaodeMapView.m
//  Dream_20180702_Factory_LBS_Demo
//
//  Created by Dream on 2018/7/2.
//  Copyright © 2018年 Tz. All rights reserved.
//

#import "GaodeMapView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "LocationProtocol.h"
@interface GaodeMapView ()
@property (nonatomic, strong) MAMapView *mapView;
@end

//具体高德地图
@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {

        
        ///初始化地图
        _mapView = [[MAMapView alloc] initWithFrame:frame];
        _mapView.userTrackingMode = MAUserTrackingModeFollow;
    }
    return self;
}

-(UIView*)getView{
    return _mapView;
}

-(void)setShowUserLocation:(BOOL)isShowUserLocation{
    
    _mapView.showsUserLocation = isShowUserLocation;

}

- (MapViewType)getMapViewType{
    
    return MapViewTypeGaode;
    
}

//添加大头针
- (void)addAnnotation:(id<LocationProtocol>)location{
    
    
    __block bool existence = NO;
    [self.mapView.annotations enumerateObjectsUsingBlock:^(MAPointAnnotation*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if([obj.title isEqualToString:[location getLocationId]]){
            existence = YES;
        }
        
    }];
    
    if(!existence){
        //添加大头针
        MAPointAnnotation *PointAnnotation = [[MAPointAnnotation alloc]init];
        PointAnnotation.coordinate = [location getLocation].coordinate;
        PointAnnotation.title = [location getLocationId];
        [self.mapView addAnnotation:PointAnnotation];
        [self.mapView setCenterCoordinate:[location getLocation].coordinate animated:YES];
    }

    
}




//高德不需要调用这两个方法来管理生命周期
- (void)viewWillAppear {

}


- (void)viewWillDisappear {

}


@end
