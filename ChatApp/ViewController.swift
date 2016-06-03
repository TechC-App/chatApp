//
//  ViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit
import SwiftWebSocket

class ViewController: UIViewController {
    
    var messageNum = 0
    let ws = WebSocket()
    
    @IBAction func firstViewReturnActionForSegue(segue: UIStoryboardSegue) {
        // anything
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let send: () -> Void = {
            self.messageNum += 1
            let msg = "\(self.messageNum): \(NSDate().description)"
            print("send: \(msg)")
            self.ws.send(msg)
        }
        
        ws.event.open = {
            print("opened")
            send()
        }
        ws.event.close = { code, reason, clean in
            print("close")
        }
        ws.event.error = { error in
            print("error \(error)")
        }
        ws.event.message = { message in
            if let text = message as? String {
                print("recv: \(text)")
                if self.messageNum == 10 {
                    self.ws.close()
                } else {
                    send()
                }
            }
        }
        
        ws.open("ws://localhost:8080")
    }
}
