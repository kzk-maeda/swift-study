//
//  ViewController.swift
//  Swift4Manga
//
//  Created by Kazuki Maeda on 2019/11/30.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var runnerImageView: UIImageView!
    
    var imageArray = [UIImage]()
    var timer1 = Timer()
    var timer2 = Timer()
    var countUp = 0
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")
        
        imageArray = [image0!, image1!, image2!, image3!, image4!, image5!]
    }

    @IBAction func run(_ sender: Any) {
        
        // start timer
        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            //count up
            self.countUp = self.countUp + 1
            
            //display in label
            self.countLabel.text = String(self.countUp)
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
            
            // display image per second in UIImage
            if (self.updateCount > 5) {
                self.updateCount = 0
                self.runnerImageView.image = UIImage(named: "dash0.png")
            } else {
                self.runnerImageView.image = self.imageArray[self.updateCount]
            }
            
            self.updateCount = self.updateCount + 1
        })
        
        
    }
    
    @IBAction func stop(_ sender: Any) {
        timer1.invalidate()
        timer2.invalidate()
    }
}

