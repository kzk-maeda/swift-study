//
//  ViewController.swift
//  Swift5RealmTodoApp
//
//  Created by Kazuki Maeda on 2019/12/04.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var itemList: Results<TodoModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = true
        tableView.allowsSelectionDuringEditing = true
        
        // Realmインスタンスの取得
        let realmInstance = try! Realm()
        
        // Realmデータベースに登録されているデータを全件取得
        self.itemList = realmInstance.objects(TodoModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // Cellが選択された時に詳細画面に飛ぶ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ( segue.identifier == "showDetail" ) {
            let x = self.tableView.indexPathForSelectedRow
            let y = x?.row
            let item = self.itemList[y!]
            let p : EditViewController = segue.destination as! EditViewController
            p.itemId = item.id
        }
    }
    
    // Table Definition
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemList == nil {
            return 0
        } else {
            return self.itemList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item: TodoModel = self.itemList[(indexPath as NSIndexPath).row];
        
        // Cellに反映
        cell.textLabel?.text = item.itemName
        cell.detailTextLabel?.text = DateUtils.stringFromDate(date: item.dueDate!, format: "yyyy/MM/dd")
        
        print(item.itemName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Realmデータベースを取得
            let realmInstance = try! Realm()
            
            // 対象Itemの削除
            try! realmInstance.write {
                realmInstance.delete(self.itemList[(indexPath as NSIndexPath).row])
            }
            
            // テーブルリストを再読み込み
            self.tableView.reloadData()
        }
    }
    
    // Cellが選択された時に詳細画面に飛ぶ
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetail", sender: itemList[indexPath.row])
    }
    
    // CellのSortができるようにする
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // TODO: do anything
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }

    
    @IBAction func searchItem(_ sender: Any) {
        // Realmインスタンスの取得
        let realmInstance = try! Realm()
        
        let searchWord = self.searchTextField.text
        // searchWordがからの時は全件取得
        if searchWord == "" {
            self.itemList = realmInstance.objects(TodoModel.self)
        } else {
            // Realmデータベースに格納されているデータからFilterしたリストを取得
            self.itemList = realmInstance.objects(TodoModel.self).filter("itemName CONTAINS %@", searchWord!)
        }
        
        // テーブルリストを再読み込み
        self.tableView.reloadData()
    }
    
}
