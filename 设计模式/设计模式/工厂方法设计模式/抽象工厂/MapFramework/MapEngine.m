//
//  MapEngine.m
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import "MapEngine.h"
#import "PlatformXmlParser.h"
#import "Platform.h"

@interface MapEngine()

@property(nonatomic, strong) NSMutableArray* array;

@end

@implementation MapEngine
- (instancetype)init{
    self = [super init];
    if (self) {
        [self loadXml];
    }
    return self;
}

-(void)loadXml{
    PlatformXmlParser* parser = [[PlatformXmlParser alloc] init];
    _array = [parser parser];
}

-(id<MapFactoryProtocol>)getFactory{
    for (Platform* platform in _array) {
        if ([platform.isOpen isEqualToString:@"YES"]) {
            return [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appKey];
        }
    }
    
    Platform* platform = _array.firstObject;
    
    return [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appKey];
}
@end
