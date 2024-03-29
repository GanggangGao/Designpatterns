//
//  AdapterMainVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

/*
 
 
 1、什么是适配器模式？
 第一点：将一个原始接口转成客户端需要的接口
 原始接口－－相当于：Adaptee
 客户端需要接口（调用者）－－－相当于：Target
 第二点：原始接口不兼容现在新的接口，将他们两个可以一起工作
 一起工作需要Adapter实现
 
 2、适配器模式-应用场景？
 第一点：接口不兼容
 第二点：可以重复使用的类，用于与一些彼此没有太大关联的一些类一起工作
 第三点：统一输出接口，输入端类型无法确定
 
 3、适配器模式-角色划分？
 3个核心角色
 角色一：适配器（核心）
 角色二：目标接口
 角色三：被适配者
 实际开发中
 UITableView
 设计思想->适配器模式
 角色一：适配器->ViewController（实现协议->两个delegate）
 角色二：目标接口->UI界面（抽象）->UITableView（Cell）
 角色三：被适配者->数据（UserModel…）
 问题来了？
 发现问题：如果你把ViewComtroller作为适配器的话，那么会出现类代码臃肿？
 写了代码：更新UI、适配UI、处理逻辑…
 解决方案：通过适配器模式优化代码结构，解决类代码臃肿问题？
 
 4、适配器模式-原理案例？
 基本结构学习明白
 适配器模式分为两种
 第一种：类适配器
 通过案例分析？
 金额转换->1000USA->适配->人民币6500
 适配器：Adapter（适配器）
 目标接口：Target
 被适配者：Adaptee
 
 第二种：对象适配器
 通过案例分析？
 金额转换->1000USA->适配->人民币6500
 适配器：Adapter（适配器）
 目标接口：Target
 被适配者：Adaptee
 
 
 类适配器与对象适配器的区别是：前者是适配器继承被适配者  后者是适配器持有被适配者
 
 
 
 5、适配器模式-开发案例？
 设计思想->适配器模式
 角色一：适配器->ViewController（实现协议->两个delegate）
 角色二：目标接口->UI界面（抽象）->UITableView（Cell）
 角色三：被适配者->数据（UserModel…）
 原始代码
 
 适配器模式优化？
 抽象->达到复用目的（重用目的）
 角色分析？
 角色一：适配器->BaseAdapter
 代替ViewController功能
 专门搞一帮人写adapter
 交互->协议（代理->block）
 专门搞一帮人写事件处理
 
 */



#import "AdapterMainVC.h"
#import "TableVIewUserBaseAdapter.h"
@interface AdapterMainVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)TableVIewUserBaseAdapter *adapter;
@end

@implementation AdapterMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.adapter = [[TableVIewUserBaseAdapter alloc]init];
    self.tableView.delegate = self.adapter;
    self.tableView.dataSource = self.adapter;
}

@end
