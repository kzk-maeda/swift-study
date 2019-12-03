//
//  ViewController.swift
//  Swift4TodoWebApp
//
//  Created by 前田　和樹 on 2019/12/02.
//  Copyright © 2019 kzk_maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 画面遷移内で戻ってきたときも呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // arrayというキーで保存された配列arrayを取り出す
        if UserDefaults.standard.object(forKey: "array") != nil {
            resultArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        // tableを再読み込み
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 動的に処理する
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セル関連
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 配列のセルのスライドされた番号の消去
            resultArray.remove(at: indexPath.row)
            // その配列を再びアプリ内保存
            UserDefaults.standard.set(resultArray, forKey: "array")
            // tableViewを更新
            tableView.reloadData()
        }
    }



}

