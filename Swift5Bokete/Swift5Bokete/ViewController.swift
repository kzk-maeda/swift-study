//
//  ViewController.swift
//  Swift5Bokete
//
//  Created by Kazuki Maeda on 2019/12/03.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import Photos

class ViewController: UIViewController {

    @IBOutlet var themeImageView: UIImageView!
    @IBOutlet var commentTextView: UITextView!
    @IBOutlet var searchTextField: UITextField!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.cornerRadius = 20.0
//        PHPhotoLibrary.requestAuthorization{(status) in
//            switch(status){
//            case .authorized:
//                break
//            case .notDetermined:
//                break
//            case .restricted:
//                break
//            case .denied:
//                break
//            @unknown default:
//                print("error")
//            }
//        }
        
        getImages(keyword: "funny")
    }
    
    // 検索キーワードを元に画像を取得
    func getImages(keyword:String) {
        let url = "https://pixabay.com/api/?key=13332925-e1535224efd5dbde7454e7e2f&q=\(keyword)"
        // Alamofireを使ってhttpリクエストを投げる
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch(response.result){
            case .success:
                let json:JSON = JSON(response.data as Any)
                let imageString = json["hits"][self.count]["webformatURL"].string
                self.themeImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                
                
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    
    @IBAction func nextImage(_ sender: Any) {
        count = count + 1
        // getImages(keyword: <#T##String#>)
        if searchTextField.text == "" {
            getImages(keyword: "funny")
        } else {
            getImages(keyword: searchTextField.text!)
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        self.count = 0
        if searchTextField.text == "" {
            getImages(keyword: "funny")
        } else {
            getImages(keyword: searchTextField.text!)
        }
    }
    
    @IBAction func decision(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
    }
}

