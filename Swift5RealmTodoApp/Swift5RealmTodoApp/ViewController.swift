//
//  ViewController.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/04.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var itemList: Results<TodoModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        tableView.dataSource = self
        
        // Realmインスタンスの取得
        let realmInstance = try! Realm()
        
        // Realmデータベースに登録されているデータを全件取得
        self.itemList = realmInstance.objects(TodoModel.self)
    }
    
    // Table Definition
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item: TodoModel = self.itemList[(indexPath as NSIndexPath).row];
        
        // Cellに反映
        cell.textLabel?.text = item.itemName
        
        return cell
    }

    
    // Button Action
    @IBAction func addItem(_ sender: Any) {
        
        // Model Classをインスタンス化
        let todoInstance: TodoModel = TodoModel()
        todoInstance.itemName = self.textField.text
        
        // Realmデータベースを取得
        let realmInstance2 = try! Realm()
        
        // TextFieldの情報をデータベースに追加
        try! realmInstance2.write {
            realmInstance2.add(todoInstance)
        }
        
        // テーブルリストを再読み込み
        self.tableView.reloadData()
    }
    

}
