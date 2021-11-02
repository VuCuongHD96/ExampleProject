//
//  Navigator.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import UIKit

enum NavigatorCase {
    case goto
    case goback
}

protocol NavigatorType {
    func navigationAction()
}

struct Navigator {
    var screenName = ""
    var type = ""
    var navigatorCase: NavigatorCase {
        if type == "goto" {
            return .goto
        } else {
            return .goback
        }
    }
    
    init(jsonData: [String : String]) {
        self.screenName = jsonData["screenName"] ?? "nothing"
        self.type = jsonData["type"] ?? "nothing"
    }
}

extension Navigator: NavigatorType {
    
    var navigationController: UINavigationController? {
        let application = UIApplication.shared
        let navigationController = application.windows[0].rootViewController as? UINavigationController
        return navigationController
    }
    
    func navigationAction() {
        let viewController = Screens(screenName: screenName).viewController
        switch navigatorCase {
        case .goto:
            gotoAction(viewController: viewController)
        case .goback:
            gobackAction()
        }
    }
    
    func gobackAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func gotoAction(viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
}
