//
//  DeepLinkViewController.swift
//  DeepLinkExample
//
//  Created by Cuong on 3/10/22.
//

import UIKit

class DeepLinkViewController: UIViewController {

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
}

