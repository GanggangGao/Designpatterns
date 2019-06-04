//
//  LocationProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/17.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


//抽象产品协议
@protocol  LocationProtocol<NSObject>

- (CLLocation *)getLocation;
- (NSString *)getLocationId;


@end
