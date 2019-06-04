//
//  CommandMainVC.m
//  设计模式
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//
/*
 
 1、命令模式-定义？
 第一点：将一个请求封装成为一个对象，从而让用户使用不同的请求将客户端参数化
 第二点：对请求排队或者纪录请求日志，以及支持撤销操作
 说白了：让我们程序扩展性更加好了，耦合降低了
 
 2、命令模式-应用场景？
 当需要将方法调用包装成一个对象，以延时方法调用，或者让其他组件在对其内部实现细节不了解的情况下进行调用的时候可以使用命令模式
 
 场景一：应用程序支持撤销和恢复
 场景二：记录请求日志，当系统故障这些命令可以重新被执行
 场景三：想用对象参数化一个动作以执行操作，并且用不同命令对象来替换回调函数
 
 3、命令模式-角色划分？
 Receiver：接收者（负责具体的功能实现，执行具体的逻辑）
 Command：命令接口（命令抽象）
 ConcreteCommand：具体的命令（调用接受者逻辑方法，行为方法）
 具体的命令需要持有接收者引用对象
 Invoker：请求者角色
 
 4、命令模式-原理案例？
 案例：电脑开机和关机
 
 5、命令模式-UML类图结构？
 StarUML工具
 给大家绘制框架UML结构图（小试牛刀）
 
 
 6、命令模式-案例分析-加强理解？->泛型设计
 案例一：原始案例->俄罗斯方块
 
 案例二：命令模式-案例设计
 
 案例三：命令模式-案例进阶-撤销功能
 
 案例四：命令模式-案例进阶-动态调用->代码优化第一步
 第一步：分析问题？
 很多命令类？->类爆炸（开发中巨大问题）
 冗余
 第二步：解决方案？
 动态命令：好处在于我们不需要新建各种命令类
 block实现
 第三步：解决问题？->实现功能？
 命令模式变种（今后当你看到了这些代码结构你要清楚知道这是命令模式变种）->DynamicCommand
 回调方式：协议、block、通知
 动态命令管理器->DynamicCommandManager
 第四步：分析调用流程？
 1、添加命令->调用了addCommand方法
 2、创建命令->createCommand创建命令
 注意：创建了一个block，将block作为了参数传递
 3、保存block->赋值给属性
 4、调用撤销->undo方法
 5、执行命令->执行DynamicCommand对象中的execute方法
 6、回调block
 7、执行tm方法->toTransform()
 架构设计->设计模式->需要你课后复习->反复理解(掌握)
 撤销
 
 案例五：命令模式-案例进阶-复合命令->优化第二步
 命令变种->复合命令：执行多个命令
 第一步：新建一个复合命令->WrapperCommand
 特点：实现协议->TMCommandProtocol
 框架设计有点枯燥->一旦你笑话了，你功力绝对大增
 第二步：新建一个复合命令管理器->WrapperCommandManager
 
 第三步：总结
 以后你看到了这样的代码结构，框架结构，你要清楚知道这是复合命令（变种）
 
 案例六：命令模式-案例进阶-泛型命令->优化第三步->系统NSUndoManager实现
 重申一次：框架设计->NSUndoManager？->课程就会应用框架
 第一步：什么是泛型？
 在定义的时候不需要指定类型，在使用的时候指定类型。
 第二步：泛型基础知识普及？->档次至少提高2个逼格
 OC、Swift、Java、C++…
 OC、Swift、Java泛型
 C++称之为模版类，模版函数
 第三步：学习泛型？
 1、新建一个泛型类->泛型命令->GenericsCommand
 注意：id是指向泛型类型引用
 2、新建一个命令管理类->泛型命令->GenericsCommandManager
 
 案例七：命令模式-案例进阶-并发处理
 1、分析问题？
 多线程当中存在同时缓存命令
 2、解决方案？
 多线程->队列
 3、功能实现？
 第一步：定义一个并发管理器->QueueCommandMananger
 
 案例八：命令模式-案例进阶-block命令（优化）
 之前：用的协议
 现在：block实现
 第一步：定义一个BlockCommandManager命令
 为什么有的地方用T，有的地方用id？
 规定：
 1、声明文件中->指定泛型->T
 2、实现文件中->指定具体类型(id万能指针->引用->指向任意对象)
 
 学习方法？
 第一大步：分析框架？架构师入门（1-3级）
 架构设计学习思路？->学习框架指导思想(方针)
 
 分为三个部分？
 第一个部分：分析框架结构
 第一步：分析框架本身核心设计模式？
 本身框架：多种设计模式融合在一起的设计
 核心设计模式
 数据库框架->构建者模式
 辅助设计模式
 例如：命令模式
 第二步：确定辅助设计模式？
 构建者模式
 第三步：分析核心设计模式角色划分？
 命令模式角色
 复习即可（4个角色）
 第四步：分析框架类对应的核心模式角色以及子类角色？
 4个角色分别对应框架中那个类
 第五步：分析辅助设计模式角色划分？
 
 第六步：分析框架类对应的辅助模式角色以及子类角色？
 第二个部分：分析框架具体实现？
 第一步：分析核心设计模式角色实现？（筛选）
 需要什么模块，你就分析什么模块
 第二步：分析辅助设计模式角色实现？（筛选）
 
 第三步部分：分析框架性能优化问题？
 第一步：分析核心设计模式角色实现？（筛选）
 需要什么模块，你就分析什么模块
 第二步：分析辅助设计模式角色实现？（筛选）
 
 第二大步：架构师晋升->修改框架源码，优化框架代码，变为自己的框架（4-6级），并且发不到github上面，今后用于面试，任何框架给到你都能够变成自己的（我也在每天在努力学习精进）
 处于这个级别
 所有面向对象语言对于你来说都是不成问题的
 
 第三大步：架构师大师->创造框架（7-9级）

 框架课程我统一上课
 设计模式：14节课，框架设计8节课（至少2比较大框架设计），项目课程10节课
 35节课样子，周期8月31日结课
 周日晚上8:30-11:00（补课，周日晚上）
 
 
 案例九：命令模式-案例进阶-使用系统命令模式框架（UndoManager）
 学架构设计->变为你的一种学习工具？
 第一个模式：讲解非常深入（结合各种语言说明）
 后面的设计模式（OC集中、Swift）
 Swift设计命令模式
 案例一：普通案例？->示例代码?
 开发地方用到命令：
 画板（撤销、圆形画笔、方形画笔、弧线画笔）
 购物车商品（命令模式）
 消息处理
 案例二：命令模式->设计？->基本命令模式设计？
 角色一：命令接口->TMCommandProtocol
 角色二：具体命令->TMLeftCommand
 TMRightCommand、TMTransformCommand
 角色三：接收者
 TetrisMachine
 角色四：请求者
 TetrisMachineManager
 
 案例三：命令模式->OC实现？->动态命令？
 代码冗余非常大（类爆炸问题）
 角色一：CommandProtocol
 角色二：DynamicCommand->具体命令
 闭包->block
 Java开发也是如此
 角色三：接收者
 TetrisMachine
 角色四：请求者
 DynamicCommandInvoke
 闭包基础知识：http://www.runoob.com/swift/swift-closures.html
 
 案例四：命令模式->Swift实现->优化代码->复合命令？
 
 
 案例五：命令模式->Swift实现->优化代码->泛型命令？
 角色一：CommandProtocol
 角色二：GenericsCommand->泛型命令
 角色三：接收者->T类型
 角色四：请求者
 GenericsCommandInvoke
 基于泛型设计->讲解框架设计（大量使用泛型）
 两个框架设计：一个是OC设计，另一个是Swift泛型设计
 用到很多种设计模式
 设计模式->理论（工具，基础零件）
 设计出来的框架运用到我们的实际开发当中
 希望童鞋们->好好理解设计模式基础知识，特别是结构（角色）
 案例六：命令模式->Swift实现->并发处理？
 手写框架（带着你从0开始手写框架）
 最简单的代码->最高级抽象代码
 QueueCommandInvoke
 
 案例七：命令模式->Swift实现->闭包命令？
 BlockCommandInvoke
 框架设计->听天书
 
 后面11：00-11:30，解答，11:30-12:00，补补语法（10-20分钟）
 每次课，课后（小昭）
 关于命令模式引用小案例？
 命令模式应用，以及代码结构优化问题，UML基础知识
 周日晚上8:30-11:30
 做一个大家熟知项目（小案例，典型案例）
 QQ：510278658
 微信：18670706913
 
 7、命令模式-应用场景案例？
 案例一：购物车商品数量？
 商品添加、商品撤销（数量删减）
 普通代码
 
 例如：画板设计（命令模式）？
 坚持
 命令模式设计？
 第一步：分析角色？
 命令接口：CommandProtocol
 具体命令：DynamicCommand
 接收者：ShoppingReceiver
 请求者：ShoppingInvoke
 少修改或者不修改，就能够扩展功能以及模块，优化代码
 
 */

#import "CommandMainVC.h"
#import "CommandDanPinVC.h"
#import "DynamicCommandDanPinVC.h"
#import "GenericsCommandDanPinVC.h"
#import "CompoundCommandDanPinVC.h"
#import "ConcurrentCommandDanPinVC.h"
#import "BlockCommandDanPinVC.h"
#import "ShoppingVC.h"
@interface CommandMainVC ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *Array;
@end

@implementation CommandMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"命令模式";
    
    self.Array = [[NSMutableArray alloc]init];
    [self.Array addObject:@"命令模式实例：单品普通"];
    [self.Array addObject:@"命令模式实例: 单品动态调用添加"];
    [self.Array addObject:@"命令模式实例：泛型命令"];
    [self.Array addObject:@"命令模式实例：复合命令"];
    [self.Array addObject:@"命令模式实例：并发处理"];
    [self.Array addObject:@"命令模式实例：闭包命令"];
    [self.Array addObject:@"购物车商品加减命令应用"];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellId = @"DesignPatternindentifer";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId];
    }
    cell.textLabel.text = [self.Array objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[[CommandDanPinVC alloc]init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[DynamicCommandDanPinVC alloc]init] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[[GenericsCommandDanPinVC alloc]init] animated:YES];
            
            break;
        case 3:
            [self.navigationController pushViewController:[[CompoundCommandDanPinVC alloc]init] animated:YES];
            break;
        case 4:
            [self.navigationController pushViewController:[[ConcurrentCommandDanPinVC alloc]init] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[[BlockCommandDanPinVC alloc]init] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[[ShoppingVC alloc]init] animated:YES];
            break;
        default:
            break;
    }
}

@end
