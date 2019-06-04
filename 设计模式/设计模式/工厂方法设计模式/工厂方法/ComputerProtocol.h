//
//  ComputerProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol  ComputerProtocol<NSObject>

//电脑规范
//处理器
-(void)CPU;
//显卡
-(void)Displaycard;
//主办
-(void)Mainborad;

@end


