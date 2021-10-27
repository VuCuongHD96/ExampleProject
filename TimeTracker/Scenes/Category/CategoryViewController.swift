//
//  CategoryViewController.swift
//  TimeTracker
//
//  Created by Sun on 27/10/2021.
//

import UIKit

final class CategoryViewController: UIViewController {

    // MARK: - Property
    let timerManager = TimerManager()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timerManager.resetTimer(screenName: "CategoryViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timerManager.stopTimer(screenName: "CategoryViewController")
    }
}
