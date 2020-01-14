//
//  InputViewController.swift
//  Swift5FirebaseApp
//
//  Created by Kazuki Maeda on 2020/01/14.
//  Copyright © 2020 Kazuki Maeda. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.layer.cornerRadius = 30.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        // ユーザー名をアプリ内に保存する
        UserDefaults.standard.set(usernameTextField.text, forKey: "userName")
        // アイコンをアプリ内に保存する
        let data = logoImageView.image?.jpegData(compressionQuality: 0.1)
        UserDefaults.standard.set(data, forKey: "userImage")
        
        // 画面遷移
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "nextVC") as! NextViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        
    }
    
    @IBAction func imageViewTap(_ sender: Any) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        // alertを表示する
        // カメラorアルバムを選択
        showAlert()
        
    }
    
    // カメラ立ち上げメソッド
    func doCamera() {
        let sourceType: UIImagePickerController.SourceType = .camera
        
        // check
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    func doAlbum() {
        let sourceType: UIImagePickerController.SourceType = .photoLibrary
        
        // check
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let albumPicker = UIImagePickerController()
            albumPicker.allowsEditing = true
            albumPicker.sourceType = sourceType
            albumPicker.delegate = self
            self.present(albumPicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.originalImage] as? UIImage != nil {
            let selectedImage = info[.originalImage] as! UIImage
            UserDefaults.standard.set(selectedImage.jpegData(compressionQuality: 0.1), forKey: "userImage")
            logoImageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Alertを作成
    func showAlert() {
        let alertController = UIAlertController(title: "選択してください", message: "どちらを使用しますか？", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            self.doCamera()
        }
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            self.doAlbum()
        }
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
