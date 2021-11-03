//
//  RemoteNotifHomeViewController.swift
//  RemoteNotification
//
//  Created by Sun on 02/11/2021.
//

import UIKit
import Reusable

final class RemoteNotifHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func gotoCategoryAction(_ sender: Any) {
        let viewController = CategoryViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension RemoteNotifHomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
