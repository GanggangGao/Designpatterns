//
//  FacadeProtocol.h
//  设计模式
//
//  Created by zachary spark on 2019/6/10.
//  Copyright © 2019 3g. All rights reserved.
//

#ifndef FacadeProtocol_h
#define FacadeProtocol_h

//家庭电器统一管理协议
@protocol FacadeProtocol <NSObject>

- (void)openTVPlayMovie;
- (void)openComputerDownloadMovie;
- (void)openXboxonePlayGame;

@end


#endif /* FacadeProtocol_h */
