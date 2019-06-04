//
//  ConcreteTemplateAvplayer.h
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TemplateAvplayer.h"
#import "AvPlayerDelegate.h"
#import "AvPlayerView.h"
@interface ConcreteTemplateAvplayer : TemplateAvplayer
@property (nonatomic,weak)id<AvPlayerDelegate> delegate;
- (void)removePlayer;
@end
