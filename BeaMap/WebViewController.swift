//
//  FirstViewController.swift
//  BeaMap
//
//  Created by jerryz on 2015/7/27.
//  Copyright (c) 2015年 JerryZ. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        webView.delegate = self
    }
}

extension WebViewController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
}