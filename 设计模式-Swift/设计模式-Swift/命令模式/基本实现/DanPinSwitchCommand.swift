//
//  DanPinSwitchCommand.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class DanPinSwitchCommand: DanPinCommandProtocol {

    var DanPin:DanPinRealization
    
    init(_ DanPin:DanPinRealization) {
        self.DanPin = DanPin
    }
    
    func execute() {
        self.DanPin.ProductSwitchOff(NSNull.init())
    }
    
}
