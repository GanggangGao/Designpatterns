//
//  Utils.h
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//一般的写法

@interface Utils : NSObject

//des 加密
-(NSString *)encryptWithDes:(NSString *)data key:(NSString *)key iv:(NSData *)iv;
//des解密
-(NSString *)decryptWithDes:(NSString *)data key:(NSString *)key iv:(NSData *)iv;


//RSA 加密
-(NSString *)encryptWithRsa:(NSString *)data key:(NSString *)key iv:(NSData *)iv;
//RSA解密
-(NSString *)decryptWithRsa:(NSString *)data key:(NSString *)key iv:(NSData *)iv;


@end

NS_ASSUME_NONNULL_END
