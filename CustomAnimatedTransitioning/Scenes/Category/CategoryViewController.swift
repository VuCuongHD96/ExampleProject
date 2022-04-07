//
//  CategoryViewController.swift
//  CustomAnimatedTransitioning
//
//  Created by Sun on 04/04/2022.
//

import UIKit

class CategoryViewController: UIViewController {

    let presentTransition = PresentTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        transitioningDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("------- debug ------- CategoryViewController -------- viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("------- debug ------- CategoryViewController -------- viewDidDisappear")
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CategoryViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentTransition
    }
}
