//
//  EditAndPostViewController.swift
//  Swift5FirebaseApp
//
//  Created by Kazuki Maeda on 2020/01/14.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit

class EditAndPostViewController: UIViewController {
    
    var passedImage = UIImage()
    
    var userName = String()
    var userImageString = String()
    var userImageData = Data()
    var userImage = UIImage()

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var commentTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // アプリ内に保存されているデータを取得
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        if UserDefaults.standard.object(forKey: "userImageData") != nil {
            userImageData = UserDefaults.standard.object(forKey: "userImageData") as! Data
            userImage = UIImage(data: userImageData)!
        }
        
        profileImageView.image = userImage
        userNameLabel.text = userName
        contentImageView.image = passedImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setToolbarHidden(true, animated: true)

    }


    @IBAction func postAction(_ sender: Any) {
    }
}
