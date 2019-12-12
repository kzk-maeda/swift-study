//
//  RegisterViewController.swift
//  Swift5ChatApp1
//
//  Created by Kazuki Maeda on 2019/12/13.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class RegisterViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var posswordTextField: UITextField!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerNewUser(_ sender: Any) {
    }
}
