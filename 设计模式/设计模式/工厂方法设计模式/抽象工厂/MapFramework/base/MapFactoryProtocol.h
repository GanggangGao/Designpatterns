//
//  MapFactoryProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapViewProtocol.h"
#import "MapLocationProtocol.h"
@protocol  MapFactoryProtocol<NSObject>

- (instancetype)initWithAppKey:(NSString *)AppKey;
//地图标准
-(id<MapViewProtocol>)getMapViewWithFrame:(CGRect)frame;

//z增加流水线
-(id<MapLocationProtocol>)getMapLocationWithMapViewProtocol:(id<MapViewProtocol>)mapview;

@end
