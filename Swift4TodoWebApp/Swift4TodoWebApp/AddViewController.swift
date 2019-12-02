//
//  AddViewController.swift
//  Swift4TodoWebApp
//
//  Created by 前田　和樹 on 2019/12/02.
//  Copyright © 2019 kzk_maeda. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func add(_ sender: Any) {
        
        // 現在の配列の状況を取り出す
        if UserDefaults.standard.object(forKey: "array") != nil {
            array = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        // TextFieldで記入されたテキストを配列に入れて、配列をアプリ内に保存する
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey: "array")
        
        // 画面を戻る
        self.navigationController?.popViewController(animated: true)
    }

}
