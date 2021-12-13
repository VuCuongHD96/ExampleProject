//
//  WebPopupViewController.swift
//  WebviewHTML
//
//  Created by Sun on 23/11/2021.
//

import UIKit
import WebKit

protocol WebPopupType {
    func load(urlType: URLType)
    func loadHTML()
}

final class WebPopupViewController: UIViewController {
    
    // MARK: - Define
    typealias ActionHandler = () -> Void
    
    // MARK: - Property
    var webview: WKWebView!
    var submitAction: ActionHandler?
    var closeAction: ActionHandler?
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        setupData()
        loadHTML()
    }
    
    // MARK: - Data
    func setupData() {
        let contentController = WKUserContentController()
        contentController.add(self, name: WebAction.submit.rawValue)
        contentController.add(self, name: WebAction.close.rawValue)
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        webview = WKWebView(frame: view.bounds, configuration: config)
        view = webview
    }
    
    // MARK: - Action
    private func choiseWebAction(with actionName: String) {
        switch actionName {
        case WebAction.submit.rawValue:
            submitAction?()
        case WebAction.close.rawValue:
            closeAction?()
        default:
            break
        }
    }
}

extension WebPopupViewController: WebPopupType {
    
    func loadHTML() {
        webview.loadHTMLString(HTMLDesign.popup, baseURL: nil)
    }
    
    func load(urlType: URLType) {
        guard let url = URL(string: urlType.url) else { return }
        let urlRequest = URLRequest(url: url)
        webview.load(urlRequest)
    }
}

// MARK: - Delegate
extension WebPopupViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage) {
        print(message.body)
        print("------------- debug: ------------- name = ", message.name)
        choiseWebAction(with: message.name)
    }
}
