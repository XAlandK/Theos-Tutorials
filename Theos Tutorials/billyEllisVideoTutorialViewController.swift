//
//  billyEllisVideoTutorialViewController.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/28/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

class billyEllisVideoTutorialViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activirtIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(URLRequest(url: URL(string: "https://www.youtube.com/embed/VwFCebaEnng")!))
        webView.delegate = self
        
        activirtIndicator.hidesWhenStopped = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        activirtIndicator.startAnimating()
        return true
    }
    
    func webViewDidFinishLoad(_ :UIWebView) {
        activirtIndicator.stopAnimating()
        NSLog("Webview load had finished")
    }
    
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        activirtIndicator.stopAnimating()
    }
    
    @IBAction func closeView(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func contactBilly(_ sender: UIBarButtonItem) {
        UIApplication.shared.openURL(URL(string: "twitter://user?screen_name=bellis1000")!)
    }
}
