//
//  LoginViewController.swift
//  Swift5ChatApp1
//
//  Created by Kazuki Maeda on 2019/12/15.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func login(_ sender: Any) {
        startAnimation()
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error as Any)
            } else {
                print("login succeeded")
                self.stopAnimation()
                self.performSegue(withIdentifier: "chat", sender: nil)
            }
        }
    }
    
    func startAnimation() {
        let animation = Animation.named("loading")
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/1.5)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
    }
    
    func stopAnimation() {
        animationView.removeFromSuperview()
    }

}
