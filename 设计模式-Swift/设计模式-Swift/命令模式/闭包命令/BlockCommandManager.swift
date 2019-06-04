
//
//  BlockCommandManager.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class BlockCommandManager: NSObject {

    //定义一个闭包
    typealias BlockCommand = ((DanPinRealization,AnyObject)->Void)
    
    var Commands:[BlockCommand] = [BlockCommand]()
    var Datas:[AnyObject] = [AnyObject]()
    var DanPin:DanPinRealization
    //在添加命令的方法加入到队列当中，可以防止多线程同时添加命令出现的命令队列混乱问题
    private var Queue:DispatchQueue = DispatchQueue.init(label: "Command")
    
    init(_ DanPin:DanPinRealization) {
        self.DanPin = DanPin
        
    }
    
    private func addCommand(_ data:AnyObject, _ method: @escaping (DanPinRealization)->(AnyObject)->(Void)){
        self.Queue.sync {
            self.Datas.append(data)
            self.Commands.append({DanPin,data in
                
                method(DanPin)(data as AnyObject)
                
            })
        }
    }
    
    func toOff(){
        
        self.addCommand(NSNull(), DanPinRealization.ProductSwitchOff)
        self.DanPin.ProductSwitchOff(NSNull.init())
    }
    
    func setTime(_ Interval:TimeInterval){
        
        self.addCommand(Interval as AnyObject,DanPinRealization.ProductSetTime)
        self.DanPin.ProductSetTime(Interval as AnyObject)
    }
    
    func switchMode(_ Mode:DanPinDetectionMode){
        self.addCommand(Mode as AnyObject, DanPinRealization.ProductDetectionMode)
        self.DanPin.ProductDetectionMode(Mode as AnyObject)
    }
    
    func Undo(){
        if self.Commands.count > 0{
            self.Commands.removeLast()(self.DanPin,self.Datas.removeLast())
        }
    }
    
    func UndoAll(){
        if self.Commands.count > 0{
            for i in 0...self.Datas.count-1{
                self.Commands[i](self.DanPin,self.Datas[i])
            }

            self.Commands.removeAll()
            self.Datas.removeAll()
        }
        
    }
    
    
    
}
