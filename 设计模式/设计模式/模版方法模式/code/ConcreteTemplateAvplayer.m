//
//  ConcreteTemplateAvplayer.m
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ConcreteTemplateAvplayer.h"
#import "Masonry.h"

@interface ConcreteTemplateAvplayer()
@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,strong)AVPlayerItem *playerItem;
@property (nonatomic,strong)AVPlayerLayer *playerLayer;
@property (nonatomic,strong)AVURLAsset *asset;

@end


@implementation ConcreteTemplateAvplayer

- (void)CreateURL:(NSString *)url{
    
    self.asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:url]];
    self.playerItem = [AVPlayerItem playerItemWithAsset:self.asset];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    
}

- (void)Prepare:(AvPlayerView *)View formController:(UIViewController*)Controller{
    
    _playerLayer = (AVPlayerLayer*)View.layer;
    _playerLayer.player = self.player;
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    NSArray *array = self.asset.tracks;
    CGSize videoSize = CGSizeZero;
    
    for (AVAssetTrack *track in array) {
        if ([track.mediaType isEqualToString:AVMediaTypeVideo]) {
            videoSize = track.naturalSize;
        }
    }
    
    CGFloat VideoScale = videoSize.width / videoSize.height;
    CGSize VideoSize = CGSizeMake(GGScreenWidth, GGScreenWidth / VideoScale);

    [View mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(VideoSize);
        make.left.mas_equalTo(Controller.view);
        make.right.mas_equalTo(Controller.view);
    }];
    

   
}

- (void)Observer{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(stop) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]) {
        [self.delegate playerCall:self.playerItem.status];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


- (void)Play{
    [self.player play];
}

- (void)Pause{
    [self.player pause];
}

- (void)removePlayer{
    
    [self.player pause];
    [self.playerLayer removeFromSuperlayer];
    [self.player.currentItem cancelPendingSeeks];
    [self.player.currentItem.asset cancelLoading];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    self.playerItem = nil;
    self.player = nil;
}


- (void)stop{

}


@end
