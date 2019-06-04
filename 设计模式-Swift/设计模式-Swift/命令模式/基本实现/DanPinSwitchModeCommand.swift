//
//  DanPinSwitchModeCommand.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class DanPinSwitchModeCommand: DanPinCommandProtocol {

    var DanPin:DanPinRealization
    
    var mode:DanPinDetectionMode = .None
    
    init(_ DanPin:DanPinRealization) {
        self.DanPin = DanPin
    }
    
    func execute() {
        self.DanPin.ProductDetectionMode(self.mode as AnyObject)
    }
    
}
