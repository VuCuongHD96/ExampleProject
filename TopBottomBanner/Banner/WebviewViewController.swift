//
//  WebviewViewController.swift
//  TopBottomBanner
//
//  Created by Sun on 19/05/2022.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://t1.mobio.vn/static/1b99bdcf-d582-4f49-9715-1b61dfff3924/upload/626b5148d7881dd69d8fff00.html"
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webview.load(request)
        }
        webview.navigationDelegate = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            removeFromSuperview()
            removeFromParent()
        }
    }
}

extension WebviewViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start load")
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        print("Finished navigating to url \(String(describing: webView.url))")
        webview.evaluateJavaScript("showPopup('\(123)')") { (any, error) in
            print("Error : \(String(describing: error))")
        }
    }
}
