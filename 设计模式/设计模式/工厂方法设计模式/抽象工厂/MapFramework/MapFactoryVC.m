//
//  MapFactoryVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MapFactoryVC.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件
#import "MapEngine.h"
#import "BaiduMapView.h"
@interface MapFactoryVC ()<MapLocationDelegateProtocol>
{
    id<MapLocationProtocol> _Location;
    
}
@property (nonatomic,strong)id<MapViewProtocol> MyMapView;
@end

@implementation MapFactoryVC


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_MyMapView viewWillAppear];

}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_MyMapView viewWillDisappear];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self CreateMapViewAndLocation];
    
    [self CreateBut];
    
}


- (void)CreateBut{
    
    UIButton *ContinuousLocationStartBut = [UIButton buttonWithType:UIButtonTypeCustom];
    ContinuousLocationStartBut.frame = CGRectMake(0, 88, 200, 40);
    [ContinuousLocationStartBut setTitle:@"开始连续定位" forState:UIControlStateNormal];
    [ContinuousLocationStartBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ContinuousLocationStartBut addTarget:self action:@selector(ContinuousLocationStartButClick:) forControlEvents:UIControlEventTouchUpInside];
    ContinuousLocationStartBut.backgroundColor = [UIColor greenColor];
    [self.view addSubview:ContinuousLocationStartBut];
    
    UIButton *ContinuousLocationStopBut = [UIButton buttonWithType:UIButtonTypeCustom];
    ContinuousLocationStopBut.frame = CGRectMake(0, 120, 200, 40);
    ContinuousLocationStopBut.backgroundColor = [UIColor greenColor];
    [ContinuousLocationStopBut setTitle:@"暂停连续定位" forState:UIControlStateNormal];
    [ContinuousLocationStopBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ContinuousLocationStopBut addTarget:self action:@selector(ContinuousLocationStopButClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ContinuousLocationStopBut];
    
}

- (void)ContinuousLocationStartButClick:(UIButton *)but{
    
    [_Location startLocation];
    
}

- (void)ContinuousLocationStopButClick:(UIButton *)but{
    
    [_Location stopLocation];
    
}


#pragma  mark -- 创建地图以及定位

- (void)CreateMapViewAndLocation{
    
    //创建工厂
    MapEngine* _engine = [[MapEngine alloc] init];
    id<MapFactoryProtocol> _factory = [_engine getFactory];
    //创建地图
    _MyMapView = [_factory getMapViewWithFrame:self.view.frame];
    [self.view addSubview:[_MyMapView getView]];
    
    //设定是否显示定位图层
    [_MyMapView setShowUserLocation:YES];
    
    //定位的功能
    
    __weak typeof(self)weakself = self;
    _Location = [_factory getMapLocationWithMapViewProtocol:_MyMapView];
    [_Location setLocationDelegate:self];
    [_Location requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:^(id<LocationProtocol>  _Nullable location, NSError * _Nullable error) {
        NSLog(@"block定位回调成功");
        NSLog(@"longitude === %lf",[location getLocation].coordinate.longitude);
        NSLog(@"latitude === %lf",[location getLocation].coordinate.latitude);
        NSLog(@"%@",error);
        [weakself.MyMapView addAnnotation:location];
        
    }];
    
    
}



#pragma  mark -- MapLocationDelegateProtocol

- (void)LocationManagerdidFailWithError:(NSError * _Nullable)error{
    
}

- (void)LocationdidUpdateLocation:(id<LocationProtocol>  _Nullable)location orError:(NSError * _Nullable)error{
    
    
    NSLog(@"连续定位回调成功");
    NSLog(@"longitude === %lf",[location getLocation].coordinate.longitude);
    NSLog(@"latitude === %lf",[location getLocation].coordinate.latitude);
    NSLog(@"%@",error);
    
    [_MyMapView addAnnotation:location];
    
}

- (void)LocationManagerdidChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
}


- (BOOL)LocationManagerShouldDisplayHeadingCalibration{
    
    return YES;
}


- (void)LocationManagerdidUpdateHeading:(CLHeading * _Nullable)heading{
    
}

- (void)LocationManagerdidUpdateNetworkState:(LocationNetworkState)state orError:(NSError * _Nullable)error{
    
    //检测网络状态改变的回调
    
    
}




-(void)dealloc {
    
    NSLog(@"释放掉了！");
    
}


@end
