//
//  AppDelegate.swift
//  DeepLinkExample
//
//  Created by Cuong on 3/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(identifier: "DeepLinkViewController") as? DeepLinkViewController else {
            return false
        }
        guard let window = window else {
            return false
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        return true
    }
}

