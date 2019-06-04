//
//  GGAesEncryption.m
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

/*
 AES 创建的关键
 
 CCCryptorStatus CCCrypt(
 CCOperation op,              //是加密，还是解密 kCCEncrypt kCCDecrypt,
    CCAlgorithm alg,          //加密的算法
    CCOptions options,        //填充模式  kCCOptionPKCS7Padding和kCCOptionECBMode
    const void *key,          //密钥长度，一般使用char keyPtr[kCCKeySizeAES256+1];
    size_t keyLength,         //加密信息的比特数
    const void *iv,           //一般都是NULL
    const void *dataIn,       //要存储的的NSdata的bytes
    size_t dataInLength,      //加密信息的长度
    void *dataOut,            //用来输出加密结果
    size_t dataOutAvailable,  //输出的大小
    size_t *dataOutMoved)
 
 */



#import "GGAesEncryption.h"
#import <CommonCrypto/CommonCrypto.h>
#import <CommonCrypto/CommonDigest.h>

@implementation GGAesEncryption

//对NSData数据进行加密
- (NSData *)encryptDataWithData:(NSData *)enData Key:(NSString *)key{
    //需要跟服务器加解密相对应
    char keyPtr[kCCKeySizeAES128 + 1];
    
    bzero(keyPtr, sizeof(keyPtr));  //置字节字符串所有字节为0
    
    //将key转换成C字符串并判读C字符转化是否可以成功
    BOOL isSuccess = [key getCString:keyPtr maxLength:sizeof(key) encoding:NSUTF8StringEncoding];
    
    if(!isSuccess){
        NSLog(@"key无法正常转换成C字符串");
        return  nil;
    }
    
    //获取需要存储的data的长度datalenght，并创建datalenght + kCCKeySizeAES128的空间
    NSUInteger datalenght = [enData length];
    size_t bufferSize = datalenght +kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numbytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [enData bytes],
                                          datalenght,
                                          buffer,
                                          bufferSize,
                                          &numbytesEncrypted);
    
    
    if(cryptStatus == kCCSuccess)
        
    {
        return [NSData dataWithBytesNoCopy:buffer length:numbytesEncrypted];
    }
    
    free(buffer);
    
    return  nil;
    
}

//对NSData数据进行解密
- (NSData *)decryptDataWithData:(NSData *)deData key:(NSString *)key{
    
    char keyPtr[kCCKeySizeAES128 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    BOOL isSuccess = [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    if(!isSuccess){
        NSLog(@"key转换成c字符串失败");
        return nil;
    }
    
    NSUInteger datalength = [deData length];
    size_t bufferSize = datalength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          keyPtr,
                                          kCCBlockSizeAES128,
                                          NULL,
                                          [deData bytes],
                                          datalength,
                                          buffer,
                                          bufferSize,
                                          &numBytesEncrypted);
    
    if(cryptStatus == kCCSuccess){
        
        return [NSData dataWithBytes:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return  nil;
    
}



- (NSString *)encryptDataWithString:(NSString *)enStr Key:(NSString *)key{
    
    const char *cStr = [enStr cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cStr length:enStr.length];
    NSData *enData = [self encryptDataWithData:data Key:key];
    
    //转换为2进制字符串
    if(enData && enData.length > 0)
    {
        Byte *datas = (Byte *)[enData bytes];
        NSMutableString *outStr = [NSMutableString stringWithCapacity:enData.length];
        for(int i = 0 ; i < enData.length ; i++)
        {
            [outStr appendFormat:@"%02x",datas[i]];
        }
        return outStr;
    }
    
    return nil;
    
}

- (NSString *)decryptDataWithString:(NSString *)deStr key:(NSString *)key{
    
    NSMutableData *data = [NSMutableData dataWithCapacity:deStr.length / 2.0];
    unsigned char whole_bytes;
    char byte_Chars[3];
    bzero(byte_Chars, sizeof(byte_Chars));

    for (int i = 0; i<[deStr length] / 2; i++) {
        byte_Chars[0] = [deStr characterAtIndex:i * 2];
        byte_Chars[1] = [deStr characterAtIndex:i * 2 +1];
        whole_bytes = strtol(byte_Chars, NULL, 16);
        [data appendBytes:&whole_bytes length:1];
    }
    
    NSData *deData = [self decryptDataWithData:data key:key];
    
    if(deData && deData.length > 0){
        return [[NSString alloc]initWithData:deData encoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

@end
