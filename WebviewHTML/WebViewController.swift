//
//  ViewController.swift
//  WebviewHTML
//
//  Created by Sun on 15/11/2021.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    lazy var webviewController = WebPopupViewController()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViewHTML()
    }
    
    // MARK: - View
    private func setupViewHTML() {
        webviewController.submitAction = submitAction
        webviewController.closeAction = closeAction
        webviewController.modalPresentationStyle = .overFullScreen
        present(webviewController, animated: true, completion: nil)
    }
    
    private func submitAction() {
        webviewController.dismiss(animated: true, completion: nil)
    }
    
    private func closeAction() {
        webviewController.dismiss(animated: true, completion: nil)
    }
}
