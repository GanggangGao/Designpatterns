//
//  PlatformXmlParser.m
//  设计模式
//
//  Created by zachary spark on 2019/5/16.
//  Copyright © 2019 3g. All rights reserved.
//

#import "PlatformXmlParser.h"
#import "Platform.h"
@interface PlatformXmlParser()
@property(nonatomic,strong)NSMutableArray *array;
@end
@implementation PlatformXmlParser

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc]init];
    }
    return self;
}


-(NSMutableArray*)parser{
    //绑定delegate
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"ConfigMap" ofType:@"plist"];
    NSMutableArray *NewArray = [NSMutableArray arrayWithArray:[NSArray arrayWithContentsOfFile:filePath]];
    for (id dict in NewArray) {
        if([dict isKindOfClass:[NSDictionary class]]){
            NSString* mapId = dict[@"id"];
            NSString* appKey = dict[@"appkey"];
            NSString* factoryName = dict[@"factoryName"];
            NSString* isOpen = dict[@"isOpen"];
            Platform* platform = [[Platform alloc] init];
            platform.mapId = mapId;
            platform.appKey = appKey;
            platform.factoryName =factoryName;
            platform.isOpen = isOpen;
            //保存
            [_array addObject:platform];
        }
    }
    
//    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
//    xmlParser.delegate = self;
//    //解析
//    [xmlParser parse];
    return _array;
}


//-(NSMutableArray*)parser{
//    //绑定delegate
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"Map.plist"];
//    NSURL* url = [[NSURL alloc] initFileURLWithPath:filePath];
//    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
//    xmlParser.delegate = self;
//    //解析
//    [xmlParser parse];
//    return _array;
//}


//
//# pragma mark - 协议方法
//
//// 开始
//- (void)parserDidStartDocument:(NSXMLParser *)parser {
//
//    NSLog(@"开始");
//
//
//
//}
//
//// 获取节点头
//- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//
//    NSLog(@"start element : %@", elementName);
//
//
//}
//
//// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
//- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//
//    NSLog(@"value : %@", string);
//
//
//}
//
//// 获取节点尾
//- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
//
//    NSLog(@"end element :%@", elementName);
//
//}
//
//// 结束
//- (void)parserDidEndDocument:(NSXMLParser *)parser {
//
//    NSLog(@"结束");
//
//}
//
//
////- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
////    //解析xml
////    if([elementName isEqualToString:@"platform"]){
////        NSString* mapId = attributeDict[@"id"];
////        NSString* appKey = attributeDict[@"appkey"];
////        NSString* factoryName = attributeDict[@"factoryName"];
////        NSString* isOpen = attributeDict[@"isOpen"];
////        Platform* platform = [[Platform alloc] init];
////        platform.mapId = mapId;
////        platform.appKey = appKey;
////        platform.factoryName =factoryName;
////        platform.isOpen = isOpen;
////        //保存
////        [_array addObject:platform];
////
////    }
////
////
////}




@end
