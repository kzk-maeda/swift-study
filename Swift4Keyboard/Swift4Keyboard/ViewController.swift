//
//  ViewController.swift
//  Swift4Keyboard
//
//  Created by Kazuki Maeda on 2019/11/30.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }

    @IBAction func signin(_ sender: Any) {
        
        resultLabel.text = mailTextField.text! + " " +  passwordTextField.text!
        
    }
    
}

