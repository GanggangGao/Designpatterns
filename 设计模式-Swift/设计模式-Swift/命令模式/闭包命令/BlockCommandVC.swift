//
//  BlockCommandVC.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/15.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class BlockCommandVC: UIViewController {

        var Manager:BlockCommandManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.Manager = BlockCommandManager.init(DanPinRealization())
      
    }


    @IBAction func toOffClick(_ sender: Any) {
        Manager?.toOff()
    }
    
    @IBAction func setTimeClick(_ sender: Any) {
        Manager?.setTime(20)
    }
    
    @IBAction func switchModeClick(_ sender: Any) {
        Manager?.switchMode(.Continuous)
    }
    
    @IBAction func unDoClick(_ sender: Any) {
        Manager?.Undo()
    }
    
    @IBAction func unDoAllClick(_ sender: Any) {
        Manager?.UndoAll()
    }

}
