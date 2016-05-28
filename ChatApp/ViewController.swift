//
//  ViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let socket = SocketIOClient(socketURL: NSURL(string: "http://52.68.248.110:8000")!, options: [.Log(true), .ForcePolling(true)])
        
        socket.on("connect") {data, ack in
            print("socket connected")
        }
        socket.on("list") { data, hoge in
            print("list")
        }
        
        socket.on("currentAmount") {data, ack in
            if let cur = data[0] as? Double {
                socket.emitWithAck("canUpdate", cur)(timeoutAfter: 0) {data in
                    socket.emit("update", ["amount": cur + 2.50])
                }
                
                ack.with("Got your currentAmount", "dude")
            }
        }
        
        socket.connect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
