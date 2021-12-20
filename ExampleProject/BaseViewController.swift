//
//  BaseViewController.swift
//  ExampleProject
//
//  Created by Sun on 26/10/2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() 
    }
    
    private func setupView() {
        overrideUserInterfaceStyle = .light
    }
}
