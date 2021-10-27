//
//  HomeViewController.swift
//  TimeTracker
//
//  Created by Sun on 27/10/2021.
//

import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Property
    let timerManager = TimerManager()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timerManager.resetTimer(screenName: "HomeViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timerManager.stopTimer(screenName: "HomeViewController")
    }
    
    @IBAction func toCategory(_ sender: Any) {
        let viewController = CategoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
