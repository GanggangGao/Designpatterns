//
//  GenericCommandManager.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class GenericCommandManager: NSObject {
    
    
    var Commands:[DanPinCommandProtocol] = [DanPinCommandProtocol]()
    var DanPin:DanPinRealization
    
    
    init(_ DanPin:DanPinRealization) {
        self.DanPin = DanPin
    }
    
    private func addCommand(_ data:AnyObject, _ method: @escaping (DanPinRealization)->(AnyObject)->(Void)){
        self.Commands.append(GenericCommand<DanPinRealization,AnyObject>.createCommand(self.DanPin, data, { (DanPin, data) in
            method(DanPin)(data as AnyObject)
        }))
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
            self.Commands.removeLast().execute()
        }
    }
    
    func UndoAll(){
        for command in self.Commands {
            command.execute()
        }
        self.Commands.removeAll()
        
    }
    

}
