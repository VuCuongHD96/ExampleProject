//
//  TwoWayBidingHTMLNativeViewController.swift
//  TwoWayBidingHTMLNative
//
//  Created by Sun on 06/12/2021.
//

import UIKit
import WebKit

final class TwoWayBidingHTMLNativeViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var webviewFarther: UIView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    
    // MARK: - Property
    var webview: WKWebView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }
    
    // MARK: - View
    private func setupWebView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "sumbitToiOS")
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        webview = WKWebView(frame: webviewFarther.bounds, configuration: config)
        let url = Bundle.main.url(forResource: "index", withExtension: "html")!
        let request = URLRequest(url: url)
        webview.load(request)
        webviewFarther.addSubview(webview)
    }
    
    // MARK: - Data
    private func createUser() -> User {
        let email = emailTextField.text ?? ""
        let fName = firstNameTextField.text ?? ""
        let lName = lastNameTextField.text ?? ""
        let user = User(email: email, firstName: fName, lastName: lName)
        return user
    }
    
    private func encodeUser(_ user: User) -> String {
        let enCoder = JSONEncoder()
        guard let userEncode = try? enCoder.encode(user),
              let userString = String(data: userEncode, encoding: .utf8) else { return "" }
        return userString
    }
    
    // MARK: - Action
    @IBAction func sendDataToWeb(_ sender: Any) {
        let user = createUser()
        let userString = encodeUser(user)
        webview.evaluateJavaScript("sendDataNativeToHTML('\(userString)')") { (any, error) in
            print("Error : \(String(describing: error))")
        }
    }
}

extension TwoWayBidingHTMLNativeViewController : WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }
}
