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
    var screenNameArray = [String]()
    var type = ""
    var navigatorCase: NavigatorCase {
        if type == "goto" {
            return .goto
        } else {
            return .goback
        }
    }
    
    init(jsonData: [String : Any]) {
        self.screenNameArray = jsonData["screenName"] as! [String]
        self.type = jsonData["type"] as! String
    }
}

extension Navigator: NavigatorType {
    
    var navigationController: UINavigationController? {
        let application = UIApplication.shared
        let navigationController = application.windows[0].rootViewController as? UINavigationController
        return navigationController
    }
    
    func navigationAction() {
        switch navigatorCase {
        case .goto:
            let viewControllers = Screens.getScreenArray(with: screenNameArray)
            gotoAction(viewControllers: viewControllers)
        case .goback:
            guard let firstItem = screenNameArray.first else { return }
            let screenType = Screens.getScreenType(with: firstItem)
            gobackAction(screenType: screenType)
        }
    }
    
    func gobackAction(screenType: UIViewController.Type) {
        for controller in navigationController!.viewControllers as Array {
            if controller.isKind(of: screenType.self) {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    func gotoAction(viewControllers: [UIViewController]) {
        viewControllers.forEach { viewController in
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
