//
//  ViewController.swift
//  TopBottomBanner
//
//  Created by Sun on 13/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func showWebview(_ sender: Any) {
        let webviewController = WebviewViewController()
        let screen = UIScreen.main.bounds
        
        webviewController.view.frame = CGRect(x: 0, y: screen.height - 700, width: screen.width, height: 700)
        addChild(webviewController)
        view.addSubview(webviewController.view)
    }
    
    @IBAction func tappedAction(_ sender: Any) {
        print("tapped")
    }
}
