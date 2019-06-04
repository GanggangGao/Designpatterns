//
//  TemplateAvplayer.m
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TemplateAvplayer.h"

@implementation TemplateAvplayer


- (instancetype)initWithViewController:(AvPlayerView *)View formController:(UIViewController*)Controller url:(NSString *)url
{
    self = [super init];
    if (self) {
        
        [self CreateURL:url];
        [self Prepare:View formController:Controller];
        [self Observer];
    }
    return self;
}


- (void)CreateURL:(NSString *)url{
    
}

- (void)Prepare:(AvPlayerView *)View formController:(UIViewController*)Controller{
    
}

- (void)Observer{
    
}

- (void)Play{
    
}

- (void)Pause{
    
}

- (void)stop{
    
    
}


@end
