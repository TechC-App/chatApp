//
//  ViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit
import milkcocoa

class ViewController: UIViewController {
    
    var messageNum = 0
    let mc = MilkCocoa(app_id: "guitarim5iraya", host: "guitarim5iraya.mlkcca.com") { c in
        print("connect.")
        
        let ds = c.dataStore("test")
        ds.on("push") { data in
            print(data.getValue())
        }
        ds.push(["message":"testA"])
    }
    
    @IBAction func firstViewReturnActionForSegue(segue: UIStoryboardSegue) {
        // anything
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
