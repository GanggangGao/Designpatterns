//
//  GGRSAEncryption.h
//  设计模式
//
//  Created by zachary spark on 2019/5/21.
//  Copyright © 2019 3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EncryptionProtocol.h"
#import "rsa.h"
#import "pem.h"
#import "err.h"
typedef enum {
    KeyTypePublic,
    KeyTypePrivate
}KeyType;
NS_ASSUME_NONNULL_BEGIN

@interface GGRSAEncryption : NSObject

@property(nonatomic, assign) RSA *rsa;

+ (instancetype)shareInstance;

//加密字典
- (NSString *)encryptDictionary:(NSDictionary*)dict WithRSAKeyType:(KeyType)keyType;

//解密base64字符串
- (NSDictionary *)decryptString:(NSString *)encryptedString WithRSAKeyType:(KeyType)keyType;

//加密数据
- (NSData *)encryptionData:(NSData *)expressData WithRSAKeyType:(KeyType)keyType;

//解密数据
- (NSData *)decryptData:(NSData *)encryptedData WithRSAKeyType:(KeyType)keyType;


@end

NS_ASSUME_NONNULL_END
