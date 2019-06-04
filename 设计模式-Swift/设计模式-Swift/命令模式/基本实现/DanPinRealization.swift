//
//  DanPinRealization.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//


//角色1 命令接口(协议) 角色2 具体命令对象 角色3 接收者 角色4 执行者

import UIKit


enum DanPinDetectionMode:Int {
    case Interval = 0
    case Continuous = 1
    case None = 2
}

class DanPinRealization: NSObject {
    
    
    func ProductSwitchOff(_ Object:AnyObject){
        print("关机命令")
        print(Object)
    }
    
    func ProductSetTime(_ time:AnyObject){
        print("设置间隔时间")
        print(time)
    }
    
    
    func ProductDetectionMode(_ mode:AnyObject){
        print("设置检测模式")
        print(mode)
    }
    

}
