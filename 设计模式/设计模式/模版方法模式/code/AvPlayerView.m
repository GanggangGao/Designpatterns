//
//  AvPlayerView.m
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import "AvPlayerView.h"
#import <AVFoundation/AVFoundation.h>
@implementation AvPlayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

@end
