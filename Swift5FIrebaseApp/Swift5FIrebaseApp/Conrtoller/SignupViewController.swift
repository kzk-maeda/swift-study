//
//  SignupViewController.swift
//  Swift5FirebaseApp
//
//  Created by Kazuki Maeda on 2020/01/14.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func login(_ sender: Any) {
        Auth.auth().signInAnonymously { (authResult, error) in
            
            let user = authResult?.user
            print(user as Any)
            
            // 画面遷移
            let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "inputVC") as! InputViewController
            self.navigationController?.pushViewController(inputVC, animated: true)
        }
    }
}
