//
//  AddViewController.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/05.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var detailField: UITextView!
    @IBOutlet var dateField: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func add(_ sender: Any) {
        
        // Model Classをインスタンス化
        let todoInstance: TodoModel = TodoModel()
        todoInstance.id = NSUUID().uuidString
        todoInstance.itemName = self.titleField.text
        todoInstance.itemDetail = self.detailField.text
        todoInstance.dueDate = self.dateField.date
        todoInstance.createdDate = NSDate() as Date
        
        // Realmデータベースを取得
        let realmInstance = try! Realm()
        
        // TextFieldの情報をデータベースに追加
        try! realmInstance.write {
            realmInstance.add(todoInstance)
        }
        
        // 元の画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
}
