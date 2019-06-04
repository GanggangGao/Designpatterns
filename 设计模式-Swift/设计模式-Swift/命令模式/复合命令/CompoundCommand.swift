//
//  CompoundCommand.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class CompoundCommand: DanPinCommandProtocol {
    
    private var commands:[DanPinCommandProtocol] = [DanPinCommandProtocol]()
    
    //执行多个命令
    var data:AnyObject?
    
    //定义个构造方法
    init(_ commands:[DanPinCommandProtocol]) {
      
        self.commands = commands
        
    }
    
    func execute() {
        
        for command in self.commands {
            command.execute()
        }
        
    }
    
    
}
