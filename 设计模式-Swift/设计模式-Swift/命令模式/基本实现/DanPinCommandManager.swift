//
//  DanPinCommandManager.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

//当命令太多的时候我们就需要了动态命令


import UIKit

class DanPinCommandManager: NSObject {

    let Off:DanPinSwitchCommand
    let SetTime:DanPinSetTimeCommand
    let SwitchMode:DanPinSwitchModeCommand
    
    var Commands:[DanPinCommandProtocol] = [DanPinCommandProtocol]()
    
    
    init(_ Off:DanPinSwitchCommand,_ SetTime:DanPinSetTimeCommand,_ SwitchMode:DanPinSwitchModeCommand) {
        
        self.Off = Off;
        self.SetTime = SetTime
        self.SwitchMode = SwitchMode
    }
    
    
    func toOff(){
        self.Off.execute()
        self.Commands.append(self.Off)
    }
    
    func setTime(_ Interval:TimeInterval){
        
        self.SetTime.Interval = Interval
        self.SetTime.execute()
        self.Commands.append(self.SetTime)
    }
    
    func switchMode(_ Mode:DanPinDetectionMode){
        
        self.SwitchMode.mode = Mode
        self.SwitchMode.execute()
        self.Commands.append(self.SetTime)
    }
    
    func Undo(){
        self.Commands.removeLast().execute()
    }
    
    func UndoAll(){
        
        for command in self.Commands {
            command.execute()
        }
        self.Commands.removeAll()
        
    }
    
}
