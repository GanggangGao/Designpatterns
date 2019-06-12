# 设计模式


## 基本的UML类图的关系

泛化关系（generalization）
三角空心实线，泛化关系表现为继承非抽象类
指向父类

实现关系（realization）   
三角空心虚线，实现关系表现为继承抽象类
指向接口

依赖关系（dependency）    
箭头虚线   依赖关系体现为类构造方法及类方法的传入参数，箭头的指向为调用关系；依赖关系处理临时知道对方，临时使用而并持有对方，这叫做依赖关系
箭头指向被调用者，例如每个对象可以使用每个抽象功能，那么就指向这个抽象功能对象

关联关系－单向关联（Directed Association） 
箭头实线  例如A知道B而B不知道A，那么B就是A的关联对象，关联对象通常是以成员变量的形式实现的，持有对方
指向被拥有者

关联关系－双向关联（Association）
实线  与单项关联不同的是：对象间相互知道 
无指向

聚合关系（Aggregation）   
空心菱形实线 聚合关系用于表示实体对象之间的关系，表示整体由部分构成的语义,整体没有了，但是部分还是存在的这叫做聚合

空心菱形指向整体，实线箭头指向部分


组合关系（Composition） 
实心菱形实线  组合关系同样表示整体由部分构成的语义，但是它们是一种强依赖的特殊聚合关系，如果整体不存在了，则部分也不存在了；例如， 公司不存在了，部门也将不存在了
实心菱形指向整体，实线箭头指向成员变量

泛化 = 实现 > 组合 > 聚合 > 关联 > 依赖 

## 设计模式之(命令模式）

### 基本概念

1.将一个请求封装成为一个对象，从而让用户使用不同的请求将客户端参数化
2.对请求排队或者纪录请求日志，以及支持撤销操作

### 角色划分

接收者（负责具体的功能实现，执行具体的逻辑）   Receiver
命令接口（命令抽象）                       Command
具体的命令（调用接受者逻辑方法，行为方法）     ConcreteCommand
请求者                                   Invoker

### UML类图

![](https://upload-images.jianshu.io/upload_images/7980283-34e35527b2d43bd0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

当需要将方法调用包装成一个对象，以延时方法调用，或者让其他组件在对其内部实现细节不了解的情况下进行调用的时候可以使用命令模式
场景一：应用程序支持撤销和恢复
场景二：记录请求日志，当系统故障这些命令可以重新被执行
场景三：想用对象参数化一个动作以执行操作，并且用不同命令对象来替换回调函数


### 命令模式的几种表现形式

1.基本实现
1)我有多少个命令，我就需要添加多少个命令文件
2.DynamicCommand 动态添加命令
1)只需要一个DynamicCommad的命令文件
2)Manager管理对象的核心思想是performSelector:withObject:方法
3)将我们所需要调用接受者的方法、参数以参数的形式给DynamicCommad
3.复合命令
1)也是单一的命令文件，与其他命令类对象只执行一次命令的结果不同的是，复合命令是执行的一连串的命令(数组)
2)在执行的过程中，遍历所有数据，依次执行。
4.GenericCommand 泛型命令    
1)将命令对象参数以泛型的形式进行创建。
5.闭包命令
1)与上述几种不同变种来讲，这种更加简单
2)在传统意义上的实现上，不再需要抽象命令、具体命令对象
3)命令的参数需要在Manager中存储


## 设计模式之(适配器模式）

### 基本概念

1.将一个原始接口转成客户端需要的接口
2.原始接口不兼容现在新的接口，将他们两个可以一起工作

### 角色划分

角色一：适配器（核心） Adapter
角色二：目标接口      Target
角色三：被适配者      Adaptee

### UML类图

![](https://upload-images.jianshu.io/upload_images/7980283-ebdc82e159ede422.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1.接口不兼容
2.可以重复使用的类，用于与一些彼此没有太大关联的一些类一起工作
3.统一输出接口，输入端类型无法确定

### 适配器模式的几种表现形式

1.对象适配器
1)说白了就是在你的适配器中添加你的被适配者引用
2)适合多个被适配者
2.类适配器
1)直接适配器继承被适配者
2)适合那种单一被适配者


## 设计模式之(工厂模式：简单工厂、工厂方法、抽象工厂）

工厂模式可以细分3个部分：简单工厂、工厂方法、抽象工厂这三种，而简单工厂又不属于GOF设计模式之一，下面就来简单介绍一下3中设计模式。


### 基本概念

简单工厂模式
1.简单工厂模式是由一个工厂对象决定创建出哪一种产品类的实例

工厂方法模式
1.定义一个创建对象的统一接口或基类：组件，然后由具体实现类或子类实现该接口
2.该组件无需了解这些实现类的细节以及它们之间的关系

抽象工厂模式
1.为该组件提供一个创建一组相关联的对象
2.无需知道创建对象所使用的类

### 角色划分

简单工厂
1.具体产品      ProductA ProductB ProductB  
2.具体工厂      Factory   

工厂方法
1.抽象产品      ProductProtocol
2.具体产品      ConcreteProductA  ConcreteProductB
3.抽象工厂      FactoryProtocol
4.具体工厂      ConcreteFactoryA  ConcreteFactoryB

抽象工厂模式
1.抽象产品      ProductProtocolA  ProductProtocolB
2.具体产品          AConcreteProductA AConcreteProductB BConcreteProductA BConcreteProductB
3.抽象工厂      FactoryProtocol
4.具体工厂      ConcreteFactoryA  ConcreteFactoryA

### UML类图

#### 简单工厂

![简单工厂.png](https://upload-images.jianshu.io/upload_images/7980283-b4b38eae4f7116e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

#### 工厂方法模式

![工厂方法模式通用.png](https://upload-images.jianshu.io/upload_images/7980283-b9a2bf4d28baec89.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/450)


#### 抽象工厂模式

![抽象工厂通用.png](https://upload-images.jianshu.io/upload_images/7980283-497ac520395a625f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

简单工厂
该组件允许调用者根据特征来获取到相应的具体产品类，就可以使用该模式

工厂方法
当多个类共同实现同一或者继承同一基类的时候，就可以使用该模式

抽象工厂
如果调用组件需要创建多个相互协作的对象，且不需要知道这些对象之间有什么PY交易，那么就可以使用该模式


## 设计模式之(策略模式）

### 基本概念

1. 定义了一系列的算法
2. 每一种算法都是单独封装的
3. 每一种算法都可以互相替换
4. 调用者可以独立变化这些算法

### 角色划分

1.策略接口
2.具体策略
3.策略的管理器

### UML类图

![策略模式.png](https://upload-images.jianshu.io/upload_images/7980283-431abee646d30f35.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/500)


### 应用场景

1. 针对同一类型的问题多种处理方式，仅仅只是具体的行为有所差别
2. 当你不需要修改原有类的情况下修改类的行为的时候，可以使用此模式
3. 出现了同一抽象类有多个子类，而又需要使用if -- else 或者switch -- case的时候使用该模式

## 设计模式之(构建者模式）

### 基本概念

1. 使用构建者模式可以将创建对象的逻辑和默认配置放入到构建者类中
2. 调用者只需了解少量的配置参数就可以创建这个对象
3. 调用者无需了解也不需要知道创建对象的默认配置信息

### 角色划分

1. 构造者 builder
2. 具体产品 ConcreteProduct
3. 参数类  parameters

### UML类图

![构建者模式.png](https://upload-images.jianshu.io/upload_images/7980283-3664382730997c19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 当创建对象需要复杂的设置，而又不想让你的配置在整个应用程序中暴漏，那么请使用构建者模式
2. 一般情况下该设计模式常常跟工厂方法、抽象工厂结合使用。


## 设计模式之(模版方法模式)

### 基本概念

1. 定义一个操作中的算法框架
2. 将一些步骤延时到子类实现
3. 子类可以不改变算法结构，可以重新定义算法的某些特定步骤

### 角色划分

1. Template         模版类
2. ConreteTemplate  具体实现类

### UML类图

![模版方法模式.png](https://upload-images.jianshu.io/upload_images/7980283-2ae7c2ec85e03ecb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 多个子类有公有方法，且逻辑基本相同
2. 重复、复杂的算法，将核心算法设计为模版方法，其周边细节可以由子类去实现
3. 代码重构


## 设计模式之(观察者模式)

### 基本概念

一定一个对象间的一对多的依赖关系，当一个对象的状态发生该拜年时，所有依赖于它的对象都得到通知并被自动更新。


### 角色划分

1. 被观察者(目标对象)
2. 具体被观察者
3. 观察者(抽象)
4. 具体观察者   多个

### UML类图

![观察者模式.png](https://upload-images.jianshu.io/upload_images/7980283-b18fc1cca857c62b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 对一个对象的改变需要同时改变其他对象，而不知道具体有多少对象需要改变时
2. 一个对象必须通知其他对象，而它并不知道其他对象具体是什么
3. 两个抽象类型相互依赖，将它们分别封装到自己的对象中，就可以对它们单独进行改变


## 设计模式之(迭代器模式)

### 基本概念

1. 迭代器提供了一种顺序访问聚合对象(集合)中元素的方法，而无需暴露结构的底层表示和细节。

### 角色划分

1. 迭代器接口
2. 具体迭代器
3. 容器接口
4. 具体容器

### UML类图

![迭代器模式.png](https://upload-images.jianshu.io/upload_images/7980283-3078a62962192456.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 需要访问聚合或组合对象中的内容，而又不希望暴露其内部的表示。
2. 需要通过多种方式遍历组合对象。
3. 需要提供一个统一的接口，用来遍历各种类型的组合对象。

### 迭代器的变种

1. 外部迭代器
1）客户端需要知道外部迭代器才能使用，但它为客户端提供了更多的控制。
2）客户端创建和维护外部迭代器
3）客户端可以使用不同外部迭代器实现多种类型的遍历
2. 内部迭代器
1）客户端不需要知道任何外部迭代器，而是通过集合对象的融合接口，或者一次只访问一个元素，或者向每个元素发送消息。
2）集合对象本身创建并维护它的外部迭代器
3）集合对象可以在不修改客户端代码的情况下，选择不同的外部迭代器。

## 设计模式之(原型模式）

### 基本概念

1. 用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。

### 角色划分

1. 克隆接口
2. 具体实现类 

### UML类图

![原型模式.png](https://upload-images.jianshu.io/upload_images/7980283-dd678bce9704ab0b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 需要创建的对象应独立于其类型与创建方式
2. 要实例化的类是在运行时决定的
3. 不想要与产品层次相对应的工厂层次
4. 不同类实例间的差异仅是状态的若干组合。因此复制相应数量的原型比手工实例化更加方便
5. 类不容易创建，比如每个组件可把其他组件作为子节点的组合对象。复制已有的组合对象并对副本进行修改更加容易

### 原型模式的变种

1. 浅拷贝
1）适用于值数据类型的拷贝，当数据不涉及到引用类型数据时
2. 深度拷贝
2）适用于对象数据类型的拷贝，当数据有多个层级引用对象时

## 设计模式之(享元模式)

### 基本概念

1. 运用共享技术有效地支持大量细粒度的对象。

### 角色划分

1. 抽象享元 (可是对象可是协议)
2. 具体享元对象
3. 享元工厂(创建管理)

### UML类图

![享元模式.png](https://upload-images.jianshu.io/upload_images/7980283-527f8623b72a351b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 系统存在大量的相似对象的时候
2. 需要使用缓冲池的时候


## 设计模式之(组合模式)

### 基本概念

1. 将对象组合成树形结构以表示“部分-整体”的层次结构，组合使得用户对单一对象和组合对象的使用具有一致性。

### 角色划分

1. 抽象根节点 (Component)
2. 具体子节点  (Composite)
3. 叶子节点 （太监节点）

### UML类图

![组合模式.png](https://upload-images.jianshu.io/upload_images/7980283-9fadc918c1ed3f01.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 表示对象的部分-整体结构时
2. 想让客户端统一处理组合结构中的所有对象

## 设计模式之(备忘录模式)

### 异同

1. 这个模式跟命令模式相似，最大不同点就是：
1）命令模式撤销需要一个一个去撤销无法指定恢复到哪个时间点，而备忘录模式可以

### 特点

1. 行为设计模式
2. 用于保存对象的当前状态，并且以后可以再次恢复到此状态
3. 需要保证被保存的对象状态不能被对象从外部访问(为了保护好被保存的这些对象状态的完整性以及内部实现不想外暴露)

### 定义

在不破坏封闭的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态，这样以后就可以将该对象恢复到原先保存的状态

### 角色划分
2个核心角色，其他角色
1. originator 备忘录创建者
2. Memo 备忘录角色

### UML类图

![备忘录.png](https://upload-images.jianshu.io/upload_images/7980283-a086b6696aaedfeb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)    

### 应用场景

1. 需要保存对象在某一时刻的状态或部分状态
2. 如果用一个接口来让其他对象的到这些状态，将会暴露对象的实现细节并破坏对象的封装性，一个对象不希望外界直接访问其内部状态，通过中间对象可以间接访问其内存


## 设计模式之(状态模式)

### 基本概念

1. 不同的状态，调用相同的功能，最终的效果不一样

### 角色划分

1. 抽象状态  StateProtocol
2. 具体状态  ConcrateState
3. 状态管理器  Context

### UML 类图

![状态模式.png](https://upload-images.jianshu.io/upload_images/7980283-549004ffeeb6aaef.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)    

### 应用场景

1. 一个对象的行为取决于它的状态，并且它必须在运行时根据状态改变它的行为
2. 程序代码中包含大量与对象状态有关的条件语句

## 设计模式之(责任链设计模式)

### 基本概念

1. 使多个对象有机会处理请求，从而避免了请求的发送者和接受者之间的耦合关系
2. 将这些对象连成一条链，并沿着这条链传递该请求，直到有对象处理它为止

### 角色划分

简单责任链设计模式
1. 抽象处理对象    Handler  
2. 具体处理对象    ConcreteHandler
复杂责任链设计模式     
1. 抽象处理角色    Handler  （父类）
2. 具体的处理角色  ConcreteHandler   多个 (子类)
3. 抽象请求角色    Request   （父类）
4. 具体请求角色    COncreteRequest  多个 (子类)

### UML类图

![责任链.png](https://upload-images.jianshu.io/upload_images/7980283-363c57222d826823.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

多个对象同时处理同以请求，但是由哪一个对象处理那么在运行时的时候决定。


## 设计模式之(解析器模式)

### 基本概念

1. 给定一个语言，定义它的文法的一种表达式，并且定义一个解析器，该解析器使用该表示来解析语言中的句子

### 角色划分

1. 抽象表达式     ExpressionProtocol
2. 终结符表达式   TerminatorExpression
3. 非终结符表达式  NonTerminatorExpression
4. 解析器上下文   ParserContext

### UML类图

![解释器.png](https://upload-images.jianshu.io/upload_images/7980283-e7cec85bb60ce08a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 如果某个简单的语言需要解析之行而且可以将该语言中的语句表示为一个抽象语法树时可以使用该模式
2. 在某哦谢特订的领域出现不断重复的问题，可以将该领域的问题转化为一种语法规则下的语句，然后构建解析器来解释该语句


## 设计模式之(桥接模式)

### 基本概念

1. 将抽象部分和实践部分分离，使他们都可以独立的进行变化

### 角色划分

1. 抽象角色         Abstraction            
2. 扩展抽象角色      ExtensionAbstraction
3. 实现抽象角色          Implementor
4. 具体实现角色      ConcreteImplementor

### UML类图

![桥接模式.png](https://upload-images.jianshu.io/upload_images/7980283-ed7907197a75856f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 开发中面临类层级结构复杂，可以使用桥接模式
2. 对不同的API之间进行桥接
3. 一个类存在俩个独立的围堵，且这俩个维度都需要进行扩展


## 设计模式之(访问者模式)

### 基本概念

1. 封装一些作用于某种数据结构中的各个元素的操作，它可以在不改变这个数据结构的前提下定义作用于这些元素的新操作

### 角色划分

1. 抽象访问者       VisitorProtocol
1）定义了每一个元素访问的行为
2）它的方法参数：就是可以访问的元素
2. 具体访问者       ConcreteVisitor
1） 给出了每一个元素类访问时所产生的具体行为
3. 元素接口         ElementProtocol
4. 具体元素         ConcreteElement
5. 对象结构(业务类)         ObjectStructure

### UML类图

![访问者.png](https://upload-images.jianshu.io/upload_images/7980283-b736bde254cd979f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 对象结构比较稳定，但经常需要在此对象结构上定义新的操作
2. 需要对一个对象结构中的对象进行很多不同并不相关的操作，而需要避免这些操作"污染"这些对象类，也不希望在增加新操作时修改这些类。

## 设计模式之(外观(门面)模式)

### 基本概念

1. 要求一个子系统的外部和其内部的通信必须通过一个统一的对象
2. 外观模式提供了一个高层次的接口，使得子系统更易于使用

### 角色划分

1. 外观角色：  Facade   为多个子系统对外提供一个共同的接口
2. 子系统角色：  SubSystem  实现系统的部分功能，客户可以通过外观角色访问
3. 客户端 ：通过一个外观角色访问各个子系统的功能


### UML类图

![外观模式.png](https://upload-images.jianshu.io/upload_images/7980283-1bb792407e71231c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 为复杂系统提供一个简单接口
2. 当我们在构建一个层次结构的子系统时，使用Facade模式定义子系统夂每一个层入口点，如果子系统之间相互依赖，可以通过此模式简化它们之间的依赖关系。


## 设计模式之(中介者模式)

### 基本概念

1. 包装了一系列对象相互作用的方法，使得这些对象不必互相引用，从而使它们可以降低耦合(松散耦合)。当某些对象之间的作用发生改变时，不会立即影响其他的一些对象之间的作用。保证这些作用可以彼此独立变化。中介者模式将多对多的相互作用转化为一对多的相互作用。中介者模式将对象的行为和协作抽象化，把对象在小尺度的行为上与其他对象的相互作用分开处理。

### 角色划分

1. Mediator (抽象中介者)
2. ConcreteMediator (具体中介者)
3. Colleague (抽象同事)
4. ConcreteColleague (具体同事)

### UML类图

![中介者.png](https://upload-images.jianshu.io/upload_images/7980283-55e8d53b81329afb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)


### 应用场景

1. 当对象之间的交互操作很多且每个对象的行为操作都依赖彼此时，为防止在修改一个对象的行为时，同时设计修改很多其他对象的行为，可以采用中介者模式来解决耦合为题。

核心：解决耦合问题


## 设计模式之(代理模式)

### 基本概念

1. 为其他对象提供一种代理，控制这个对象的访问。

### 角色划分

1. 角色一：具体代理对象  ConcreteProxy
1）持有目标对象引用
2）实现目标接口
2. 角色二：目标接口
3. 角色三：具体目标对象

### UML类图

![代理模式.png](https://upload-images.jianshu.io/upload_images/7980283-9c83eb7bf669a32e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 由于一些原因，对象本身无法去完成这个方法，这个时候需要使用代理模式


## 设计模式之(装饰模式)

### 基本概念

1. 动态的给一个对象添加一些额外的职责。

### 角色划分

1. 抽象对象  ObjectiveProtocol
2. 具体对象  Concreteobjective
3. 抽象装饰  DecoratorProtocol
4. 具体装饰  ConcreteDecorator

### UML类图

![装饰模式.png](https://upload-images.jianshu.io/upload_images/7980283-6923e9bf65f658f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/550)

### 应用场景

1. 需要透明且动态的扩展类的功能。
