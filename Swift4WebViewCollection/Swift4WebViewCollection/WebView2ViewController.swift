//
//  WebView2ViewController.swift
//  Swift4WebViewCollection
//
//  Created by Kazuki Maeda on 2019/12/01.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit
import WebKit

class WebView2ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var WebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        WebView.uiDelegate = self as? WKUIDelegate
        
    }
    

}
