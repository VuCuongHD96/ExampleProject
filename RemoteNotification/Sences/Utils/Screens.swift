//
//  Screens.swift
//  RemoteNotification
//
//  Created by Sun on 03/11/2021.
//

import UIKit

enum Screens: String {
    case none
    case categoryScreen
    case homeScreen
    
    init(screenName: String) {
        switch screenName {
        case Self.categoryScreen.rawValue:
            self = .categoryScreen
        case Self.homeScreen.rawValue:
            self = .homeScreen
        default:
            self = .none
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .categoryScreen:
            return CategoryViewController()
        case .homeScreen:
            return RemoteNotifHomeViewController.instantiate()
        case .none:
            return UIViewController()
        }
    }
}
