//
//  Encryption.h
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol EncryptionProtocol<NSObject>


//对NSData加解密
- (NSData *)encryptDataWithData:(NSData *)enData Key:(NSString *)key;

- (NSData *)decryptDataWithData:(NSData *)deData key:(NSString *)key;


//对NSString 进行加解密
- (NSString *)encryptDataWithString:(NSString *)enStr Key:(NSString *)key;

- (NSString *)decryptDataWithString:(NSString *)deStr key:(NSString *)key;



@end

