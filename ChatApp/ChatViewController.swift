//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Teacher on 2016/05/21.
//  Copyright © 2016年 AKYLab. All rights reserved.
//

import UIKit
import milkcocoa

class ChatViewController: UIViewController {
    
    var mc: MilkCocoa?
    var ds: DataStore?
    
    // チャットメッセージ表示テーブル
    @IBOutlet weak var tableView: UITableView!
    
    // テキスト入力
    @IBOutlet weak var textField: UITextField!
    
    // 送信ボタンタップ時イベント
    @IBAction func didTapSendButton(sender: UIButton) {
        let message = textField.text ?? ""
        ds!.send(["message":message])
        
    }
    
    // チャットに表示されるメッセージリスト
    var messageList = [String]()
    // 下の書き方でもOK
    // var messageList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mc = MilkCocoa(app_id: "guitarim5iraya", host: "guitarim5iraya.mlkcca.com") { c in
            print("hoge")
            self.ds = c.dataStore("test")
            self.ds!.on("send") { data in
                self.messageList.append((data.getValue("value") as! Dictionary)["message"]!)
                self.updateTable()
            }
        }
        
    }
    
    func updateTable() {
        // テーブルをリロードする
        tableView.reloadData()
        
        // テーブルの表示位置を更新
        
        // テーブルに表示されている行数を取得
        let rowCount = tableView.numberOfRowsInSection(0) // セクションは1個固定なので0指定で良い
        // 表示される行数 = メッセージの数なので以下でもOK
        // let rowCount = messageList.count
        
        // 一番下のセル位置
        let indexPath = NSIndexPath(forRow: rowCount - 1, inSection: 0)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: true)
        
        // メッセージ入力欄をクリアする
        textField.text = ""
    }
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