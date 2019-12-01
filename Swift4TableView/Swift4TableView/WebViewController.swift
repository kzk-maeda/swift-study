//
//  WebViewController.swift
//  Swift4TableView
//
//  Created by Kazuki Maeda on 2019/12/02.
//  Copyright © 2019 Kazuki Maeda. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var WebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebView.delegate = self
        let url = URL(string: "https://www.jalan.net/news/article/100005/")!
        let urlRequest = URLRequest(url: url)
        WebView.loadRequest(urlRequest)

    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    @IBAction func susumu(_ sender: Any) {
        WebView.goForward()
    }
    
    @IBAction func modoru(_ sender: Any) {
        WebView.goBack()
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
