//
//  AvPlayerDelegate.h
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol AvPlayerDelegate<NSObject>

- (void)playerCall:(AVPlayerItemStatus)Status;

@end
