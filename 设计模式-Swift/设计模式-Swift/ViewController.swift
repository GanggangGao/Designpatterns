//
//  ViewController.swift
//  设计模式-Swift
//
//  Created by zachary spark on 2019/5/14.
//  Copyright © 2019 3g. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    let Cellidentifier:String = "Cellidentifier"
    
    var Array:[String] = [String]()
    
    
    @IBOutlet weak var tableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Array.append("命令模式实例：单品普通")
        Array.append("命令模式实例：单品动态调用添加命令")
        Array.append("命令模式实例：复合命令")
        Array.append("命令模式实例：泛型命令")
        Array.append("命令模式实例：并发处理")
        Array.append("命令模式实例：闭包命令")
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array.count;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: Cellidentifier)
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: Cellidentifier)
        }
        cell?.textLabel?.text = Array[indexPath.row]
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(DanPinCommandVC(), animated: true)
            break
        case 1:
            self.navigationController?.pushViewController(DynamicCommandVC(), animated: true)
            break
        case 2:
            self.navigationController?.pushViewController(CompoundCommandVC(), animated: true)
            break
        case 3:
            self.navigationController?.pushViewController(GenericCommandVC(), animated: true)
            break
        case 4:
            self.navigationController?.pushViewController(QueueCommandVC(), animated: true)
            break
        case 5:
            self.navigationController?.pushViewController(BlockCommandVC(), animated: true)
            break
//        case 0:
//            break
//        case 0:
//            break
        default:
            break
        }
    }
    
    
}

