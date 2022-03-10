//
//  KeyChainViewController.swift
//  KeyChainExample
//
//  Created by Cuong on 3/9/22.
//

import UIKit

class KeyChainViewController: UIViewController {

    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var passTextField: UITextField!
    @IBOutlet private weak var accountTextField: UITextField!
    
    let keyChain = KeyChain.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteAction() {
        keyChain.remove()
    }
    
    @IBAction func getDataAction() {
        let accountText = accountTextField.text ?? ""
        let result = keyChain.retrivePassword(for: accountText)
        print("------ App KeyChain -------- result = ", result)
    }
    
    @IBAction func saveDataAction() {
        let accountText = accountTextField.text ?? ""
        let passText = passTextField.text ?? ""
        keyChain.save(password: passText, for: accountText)
    }
    
    @IBAction func toDeepLinkApp(_ sender: Any) {
        let customUrl = "LocationApp://"
        if let url = URL(string: customUrl), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            print("This app not install yet")
        }
    }
}
