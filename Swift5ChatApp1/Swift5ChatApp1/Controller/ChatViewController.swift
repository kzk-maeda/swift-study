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
    
    @IBOutlet var sendButton: UIButton!
    
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
        fetchChatData()
        
        // delete cell line
        tableView.separatorStyle = .none
        
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
        cell.messageLabel.layer.cornerRadius = 20
        cell.messageLabel.layer.masksToBounds = true
        cell.userNameLabel.text = chatArray[indexPath.row].sender
        cell.iconImageView.image = UIImage(named: "dogAvatarImage")
        
        if cell.userNameLabel.text == Auth.auth().currentUser?.email as? String {
            cell.messageLabel.backgroundColor = UIColor.flatGreen()
        } else {
            cell.messageLabel.backgroundColor = UIColor.flatBlue()
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 10
    }
    
    @IBAction func sendAction(_ sender: Any) {
        messageTextField.endEditing(true)
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        // validation
        if messageTextField.text!.count > 15 {
            print("over 15 letters")
            self.messageTextField.isEnabled = true
            self.sendButton.isEnabled = true
            return
        }
        
        let chatDB = Database.database().reference().child("chats")
        
        // send key-value
        let messageInfo = ["sender": Auth.auth().currentUser?.email, "message": messageTextField.text]
        
        chatDB.childByAutoId().setValue(messageInfo) { (error, result) in
            if error != nil {
                print(error as Any)
            } else {
                self.messageTextField.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextField.text = ""
                print("send succeeded")
            }
        }
        
        // fetchChatData()
    }
    
    func fetchChatData() {
        let fetchDataRef = Database.database().reference().child("chats")
        fetchDataRef.observe(.childAdded) { (snapshot) in
            let snapshotData = snapshot.value as! AnyObject
            let text = snapshotData.value(forKey: "message")
            let sender = snapshotData.value(forKey: "sender")
            
            let message = Message()
            message.message = text as! String
            message.sender = sender as! String
            self.chatArray.append(message)
            self.tableView.reloadData()
        }
        
    }
    
}
