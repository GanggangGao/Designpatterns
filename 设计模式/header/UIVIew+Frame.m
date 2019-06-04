//
//  UIVIew+Frame.m
//  设计模式
//
//  Created by zachary spark on 2019/5/28.
//  Copyright © 2019 3g. All rights reserved.
//

#import "UIVIew+Frame.h"

@implementation UIVIew_Frame

- (void)setGGsize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)ggsize{
    return self.frame.size;
}

- (void)setGGorigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)GGorigin{
    return self.frame.origin;
}

- (void)setGGx:(CGFloat)x{
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)GGx{
    return self.frame.origin.x;
}

- (void)setGGy:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)GGy{
    return self.frame.origin.y;
}


@end
