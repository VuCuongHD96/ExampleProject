//
//  ViewController.swift
//  KeyChainExample
//
//  Created by Cuong on 3/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        save("pass", for: "accABC")
        
    }

    func save(_ password: String, for account: String) {
            let password = password.data(using: String.Encoding.utf8)!
            let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                        kSecAttrAccount as String: account,
                                        kSecValueData as String: password]
            let status = SecItemAdd(query as CFDictionary, nil)
            guard status == errSecSuccess else { return print("save error")
        }
    }

    func retrivePassword(for account: String) -> String? {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: account,
                                    kSecMatchLimit as String: kSecMatchLimitOne,
                                    kSecReturnData as String: kCFBooleanTrue]
        var retrivedData: AnyObject? = nil
        let _ = SecItemCopyMatching(query as CFDictionary, &retrivedData)
        guard let data = retrivedData as? Data else {return nil}
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    func removeKeyChain() {
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
    }
    
    @IBAction func deleteAction() {
        print("start delete")
        removeKeyChain()
    }
    
    @IBAction func getDataAction() {
        let result = retrivePassword(for: "accABC")
        print("------ result = ", result)
    }
}
