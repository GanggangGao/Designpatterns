//
//  GenericCommand.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class GenericCommand<T,D>: DanPinCommandProtocol {

    private var receiver:T
    
    private var block:(T,D?)->Void
    
    //由于swift是一门严谨的语言
    //这个动态命令的参数，如果为空，当命令execute的时候就不进行传递参数
    var data:D?
    
    //定义个构造方法
    init(_ receiver:T,_ data:D?,_ block:@escaping (T,D?)->Void) {
        self.data = data
        self.receiver = receiver
        self.block = block
    }
    
    func execute() {
        self.block(self.receiver,self.data)
    }
    
    //创建动态命令的方法
    class func createCommand(_ receiver:T,_ data:D?, _ block:@escaping(T,D?)->Void)->DanPinCommandProtocol{
        return GenericCommand(receiver,data,block)
        
    }
    
    
}
