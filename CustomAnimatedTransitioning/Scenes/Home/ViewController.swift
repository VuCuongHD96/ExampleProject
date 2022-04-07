//
//  ViewController.swift
//  CustomAnimatedTransitioning
//
//  Created by Sun on 04/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toCategoryScreen() {
        let webHeight: CGFloat = 600
        showCategory(webHeight: webHeight)
    }
    
    func showCategory(webHeight: CGFloat) {
        let transitionOrientation = TransitionOrientation.center(height: webHeight)
        let halfSizeVC = CategoryViewController()
        halfSizeVC.view.frame = transitionOrientation.frame
        halfSizeVC.modalPresentationStyle = .custom
        present(halfSizeVC, animated: true, completion: nil)
    }
    
    @IBAction func tapAction(_ sender: Any) {
        print("------- debug --------- tap")
    }
}
