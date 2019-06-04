//
//  TemplateAvplayer.h
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AvPlayerView.h"

@interface TemplateAvplayer : NSObject

- (instancetype)initWithViewController:(AvPlayerView *)View formController:(UIViewController*)Controller url:(NSString *)url;

- (void)CreateURL:(NSString *)url;

- (void)Prepare:(AvPlayerView *)View formController:(UIViewController*)Controller;

- (void)Observer;

- (void)Play;

- (void)Pause;

- (void)stop;



@end
