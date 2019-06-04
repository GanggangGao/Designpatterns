//
//  FactoryMethodVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import "FactoryMethodVC.h"
#import "SXComputerFatory.h"
#import "MacComputerFatory.h"
#import "BaiduMapFactory.h"
#import "GaodeMapFactory.h"
#import "MapEngine.h"
#import "MapFactoryVC.h"
@interface FactoryMethodVC ()

@end

@implementation FactoryMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    
    
    
}

//简单工厂
- (IBAction)Computerfactory:(id)sender {
    
    
    id<ComputerFatoryProtocol>SXfactory = [[SXComputerFatory alloc]init];
    id<ComputerProtocol>SXcomputer = [SXfactory getComputer];
    [SXcomputer CPU];
    [SXcomputer Displaycard];
    [SXcomputer Mainborad];
    
    
    id<ComputerFatoryProtocol>Macfactory = [[MacComputerFatory alloc]init];
    id<ComputerProtocol>Maccomputer = [Macfactory getComputer];
    [Maccomputer CPU];
    [Maccomputer Displaycard];
    [Maccomputer Mainborad];
    
}

//工厂方法
- (IBAction)BaiduGaodeFactory:(id)sender {
    
    id<MapFactoryProtocol>Baidufactory = [[BaiduMapFactory alloc]init];
    id<MapViewProtocol>BaiduMapView = [Baidufactory getMapViewWithFrame:self.view.frame];
    [self.view addSubview:[BaiduMapView getView]];
    
    id<MapFactoryProtocol>Gaodefactory = [[GaodeMapFactory alloc]init];
    id<MapViewProtocol>GaodeMapView = [Gaodefactory getMapViewWithFrame:self.view.frame];
    [self.view addSubview:[GaodeMapView getView]];
    
}



//抽象
- (IBAction)DynamicSwitchMapView:(id)sender {
    
    MapEngine* engine = [[MapEngine alloc] init];
    id<MapFactoryProtocol> factory = [engine getFactory];
    id<MapViewProtocol> mapView = [factory getMapViewWithFrame:self.view.frame];
    [mapView setShowUserLocation:YES];
    [self.view addSubview:[mapView getView]];
    
}

- (IBAction)OpenMapClick:(id)sender {
    [self.navigationController pushViewController:[[MapFactoryVC alloc]init] animated:YES];
}


@end
