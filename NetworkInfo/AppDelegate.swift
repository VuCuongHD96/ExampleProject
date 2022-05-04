//
//  AppDelegate.swift
//  NetworkInfo
//
//  Created by Sun on 04/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let result = ConnectionManager.shared
        print("------- Appdelegate ------- result = ", result.bluetooth)
        toHome()
        return true
    }
    
    func toHome() {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

