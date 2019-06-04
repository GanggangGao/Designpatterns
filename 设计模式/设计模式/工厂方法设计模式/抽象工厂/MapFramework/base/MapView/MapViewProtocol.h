//
//  MapViewProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationProtocol.h"
typedef NS_ENUM(NSUInteger, MapViewType) {
    MapViewTypeBaidu = 0,
    MapViewTypeGaode,
};

@protocol  MapViewProtocol<NSObject>

- (instancetype)initWithFrame:(CGRect)frame;

//规范->父类的引用指向子类的实例对象
-(UIView*)getView;

//...地图类型、地图语言、是否开启交通....
//先忽略...

//是否显示定位
-(void)setShowUserLocation:(BOOL)isShowUserLocation;


//返回地图的类型

- (MapViewType)getMapViewType;


//添加大头针
- (void)addAnnotation:(id<LocationProtocol>)location;



#pragma  mark --  管理地图的生命周期
/*
 由于百度地图SDK必须的。
 BMKMapView使用viewWillAppear、viewWillDisappear方法来控制BMKMapView的生命周期，
 并且在一个时刻只能有一个BMKMapView接受回调消息，
 因此在使用BMKMapView的viewController中必须需要在viewWillAppear、viewWillDisappear方法中
 调用BMKMapView的对应的方法。

 */

@optional
- (void)viewWillAppear;

- (void)viewWillDisappear;

@end
