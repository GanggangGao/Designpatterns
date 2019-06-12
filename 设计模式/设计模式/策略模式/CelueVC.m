//
//  CelueVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/20.
//  Copyright © 2019 3g. All rights reserved.
//

#import "CelueVC.h"
#import "ZhaocaibaoLicai.h"
#import "dingcunbao.h"
#import "GGAesEncryption.h"
#import "rsa.h"
@interface CelueVC ()

@end

@implementation CelueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    id<Licai> dingcunlicai = [[dingcunbao alloc]init];
//
//    int dingcunmoney = [dingcunlicai licaiwithMoth:12 money:10000];
//    NSLog(@"%d",dingcunmoney);
//
//    id<Licai> Zhaocailicai = [[ZhaocaibaoLicai alloc]init];
//
//    int Zhaocaimoney = [Zhaocailicai licaiwithMoth:12 money:10000];
//    NSLog(@"%d",Zhaocaimoney);

    
    NSString *Str = @"Struggle3g";
    
//    NSData *strdata = [Str dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    
    id<EncryptionProtocol> encryption = [[GGAesEncryption alloc]init];
    
    NSString *enstr = [encryption encryptDataWithString:Str Key:@"gg"];
    
    NSLog(@"%@",enstr);
    NSLog(@"%@",[encryption decryptDataWithString:enstr key:@"gg"]);
    
    
//    NSData *endata =[encryption encryptDataWithData:strdata Key:@"gg"];
//
//    NSData *dedata = [encryption decryptDataWithData:endata key:@"gg"];
//    NSLog(@"%@",[[NSString alloc]initWithData:dedata encoding:NSUTF8StringEncoding]);
    
    
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
