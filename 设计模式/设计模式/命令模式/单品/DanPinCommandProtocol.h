//
//  DanPinCommandProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/5/13.
//  Copyright © 2019 3g. All rights reserved.
//

//所谓的命令模式，1.就是将对象所做的操作参数话，也就是一个命令方法、请求，生成一个对象
//2.生成请求队列或记录日志，
//3.可撤销操作




#ifndef DanPinCommandProtocol_h
#define DanPinCommandProtocol_h

//单品的接口
@protocol DanPinCommandProtocol <NSObject>

//操作->具体的方法
//这里只有执行，每一个命令都会封装成一个对象，遵守这个协议，实现执行方法，因为每一个命令都是
- (void)execute;

@end



#endif /* DanPinCommandProtocol_h */
