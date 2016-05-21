//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
}

// DataSourceの中身を定義するために、UITableViewDataSourceに適合させる
extension ChatViewController: UITableViewDataSource {
    
    // テーブルのセクション毎の行数を定義
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 一旦固定で10行にする
        return 10
    }
    
    // セル毎のオブジェクトを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "chatCell")
        
        // Optionalへのアクセス
        // ? でアクセスすると、nilの時は無視する(その行のそれ以降の処理は行わない)
        cell.textLabel?.text = "test"
        
        return cell
    }
}