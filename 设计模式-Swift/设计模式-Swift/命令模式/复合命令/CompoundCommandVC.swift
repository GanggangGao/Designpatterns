//
//  CompoundCommandVC.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class CompoundCommandVC: UIViewController {

    
    var Manager:CompoundCommandManager = CompoundCommandManager(DanPinRealization())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func SetTimeAndModeClick(_ sender: Any) {
        Manager.SetTimeAndMode([20 as AnyObject, DanPinDetectionMode.Interval as AnyObject])
    }
    
    @IBAction func unDoClick(_ sender: Any) {
        Manager.Undo()
    }
}
