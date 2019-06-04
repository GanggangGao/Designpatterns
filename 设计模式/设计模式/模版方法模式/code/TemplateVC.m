//
//  TemplateVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/27.
//  Copyright © 2019 3g. All rights reserved.
//

#import "TemplateVC.h"
#import "ConcreteTemplateAvplayer.h"

@interface TemplateVC ()<AvPlayerDelegate>
@property (nonatomic,strong)ConcreteTemplateAvplayer *avplayer;
@end

@implementation TemplateVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *path = [[NSBundle mainBundle]pathForResource:@"boren" ofType:@"mp4"];

    _avplayer = [[ConcreteTemplateAvplayer alloc]initWithViewController:self.AvplayerView formController:self url:path];
    _avplayer.delegate = self;
    [_avplayer Play];
    
}


- (void)playerCall:(AVPlayerItemStatus)Status{
    
    switch (Status) {
        case AVPlayerItemStatusReadyToPlay:
            NSLog(@"播放成功");
            break;
            
        default:
            NSLog(@"播放失败");
            break;
    }
    
}


- (void)dealloc
{
    [self.avplayer removePlayer];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
