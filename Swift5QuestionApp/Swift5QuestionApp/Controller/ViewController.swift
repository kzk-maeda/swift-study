//
//  ViewController.swift
//  Swift5QuestionApp
//
//  Created by Kazuki Maeda on 2019/12/07.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumer = 0
    
    let imagesList = ImagesList()
    var pickedAnswer = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumer = 0
        
        imageView.image = UIImage(named: imagesList.list[questionNumer].imageText)
    }

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            // 丸が押された時
            pickedAnswer = true
            
        }else if (sender as AnyObject).tag == 2 {
            // 罰が押された時
            pickedAnswer = false
        }
        
        // Check
        
        
    }
    
//    func check(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
    
}

