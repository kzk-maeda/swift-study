//
//  ChatViewController.swift
//  Swift5ChatApp1
//
//  Created by Kazuki Maeda on 2019/12/15.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var messageTextField: UITextField!
    
    // get screen size
    let screenSize = UIScreen.main.bounds.size
    
    var chatArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        // cell
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
        
        // Keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Fetch data from Firebase
        
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        let keyboardHight = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        messageTextField.frame.origin.y = keyboardHight - messageTextField.frame.height
    }
    
    @objc func keyboardWillHide(_ notification:NSNotification) {
        messageTextField.frame.origin.y = screenSize.height - messageTextField.frame.height
        
        guard let rect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue, let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return
        }
        
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.transform = transform
        }
        
    }
    
    // Close text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.messageLabel.text = chatArray[indexPath.row].message
        cell.userNameLabel.text = chatArray[indexPath.row].sender
        cell.iconImageView.image = UIImage(named: "dogAvatarImage")
        
        if cell.userNameLabel.text == Auth.auth().currentUser?.email as? String {
            cell.messageLabel.backgroundColor = UIColor.flatGreen()
        } else {
            cell.messageLabel.backgroundColor = UIColor.flatBlue()
        }
        
        
        
        return cell
    }

}
