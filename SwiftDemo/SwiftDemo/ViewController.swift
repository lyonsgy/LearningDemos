//
//  ViewController.swift
//  SwiftDemo
//
//  Created by lyons on 2018/4/4.
//  Copyright © 2018年 lyons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    let names = ["Chris","Alex","Ewa","Barry","Daniella"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "\(names)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //函数（隐式参数）
    func getString(_ name:String,nickName:String) -> String {
        return "name:\(name),nickName:\(nickName)"
    }
    
    //闭包（数组首字母排序）
    func getBlock(){
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        var reversedNames : Array<Any>;
        //        reversedNames = names.sorted(by: backward)
        //        reversedNames = names.sorted(by: { $0 > $1 } )
        //        reversedNames = names.sorted(by: > )
        
        reversedNames = names.sorted{ $0 > $1 }
        
        label.text = "\(reversedNames)"
    }
    
    @IBAction func btnClick(_ sender: Any) {
        getBlock()
    }
    
    
}

