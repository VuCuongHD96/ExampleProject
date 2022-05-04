//
//  SecondViewController.swift
//  NetworkInfo
//
//  Created by Sun on 05/05/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    let result = ConnectionManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("------- ViewController 2 ------- result = ", result.bluetooth)
    }
}
