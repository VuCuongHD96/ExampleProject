//
//  ViewController.swift
//  NetworkInfo
//
//  Created by Sun on 04/05/2022.
//

import UIKit

class ViewController: UIViewController {
        
    let result = ConnectionManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toScreenTwoAction(_ sender: Any) {
        let screenTwo = SecondViewController()
        navigationController?.pushViewController(screenTwo, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("------- ViewController 1 ------- result = ", result.bluetooth)
    }
}
