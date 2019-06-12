//
//  ComputerCPU.m
//  设计模式
//
//  Created by zachary spark on 2019/6/11.
//  Copyright © 2019 3g. All rights reserved.
//

#import "ComputerCPU.h"


@interface ComputerCPU()
{
 
    NSString *videoData;
    NSString *soundData;
    
}
@end

@implementation ComputerCPU

- (NSString *)getVideoData{
    return videoData;
}

- (NSString *)getSoundData{
    return soundData;
}

- (void)deCodeData:(NSString *)data{
    
    NSArray *array = [data componentsSeparatedByString:@","];
    videoData = array[0];
    soundData = array[1];
    [self.Mediator changedColleague:self];
    
}




@end
