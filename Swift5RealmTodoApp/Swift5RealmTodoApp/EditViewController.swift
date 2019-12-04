//
//  EditViewController.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/05.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import RealmSwift

class EditViewController: UIViewController {
    
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var createdLabel: UILabel!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var detailField: UITextView!
    @IBOutlet var dateField: UIDatePicker!
    
    var itemId: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Realmインスタンスの取得
        let realmInstance = try! Realm()
        
        // Itemの取得
        print(itemId!)
        let item: TodoModel = realmInstance.object(ofType: TodoModel.self, forPrimaryKey: itemId)!
        
        idLabel.text = item.id
        createdLabel.text = DateUtils.stringFromDate(date: item.createdDate!, format: "yyyy/MM/dd hh:mm:ss")
        titleField.text = item.itemName
        detailField.text = item.itemDetail
        dateField.date = item.dueDate!
        
    }
    

}
