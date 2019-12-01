//
//  SecondViewController.swift
//  Swift4TableView
//
//  Created by Kazuki Maeda on 2019/12/01.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var box = String()
    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(box)
        result.text = box

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
