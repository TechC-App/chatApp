//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // チャットメッセージ表示テーブル
    @IBOutlet weak var tableView: UITableView!
    
    // テキスト入力
    @IBOutlet weak var textField: UITextField!
    
    // 送信ボタンタップ時イベント
    @IBAction func didTapSendButton(sender: UIButton) {
        // A ?? B => Aの値が存在すればその値をそのまま、存在しない(=nil)場合は、Bの値を使う
        // イメージ: A.exist ? A : B
        let message = textField.text ?? ""
        messageList.append(message)
        
        // テーブルをリロードする
        tableView.reloadData()
    }
    
    // チャットに表示されるメッセージリスト
    var messageList = [
        "A: こんにちは",
        "B: こんにちは",
        "A: 今日はいい天気ですね",
        "B: メッセージ4",
        "A: メッセージ5",
        "A: メッセージ6",
        "B: メッセージ7",
        "B: メッセージ8",
        "A: メッセージ9",
        "A: メッセージ10",
    ]
}

// DataSourceの中身を定義するために、UITableViewDataSourceに適合させる
extension ChatViewController: UITableViewDataSource {
    
    // テーブルのセクション毎の行数を定義
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    // セル毎のオブジェクトを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "chatCell")
        
        // 何番目のセルかはindexPathから取得できる
        let num = indexPath.row
        cell.textLabel?.text = messageList[num]
        
        return cell
    }
}