//
//  DanPinSetTimeCommand.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class DanPinSetTimeCommand: DanPinCommandProtocol {

    var DanPin:DanPinRealization
    
    var Interval:TimeInterval = 10  //默认10秒
    
    init(_ DanPin:DanPinRealization) {
        self.DanPin = DanPin
    }
    
    func execute() {
        self.DanPin.ProductSetTime(self.Interval as AnyObject)
    }
    
}
