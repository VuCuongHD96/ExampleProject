//
//  AppDelegate.swift
//  ExampleNotification
//
//  Created by Sun on 07/10/2021.
//

import UIKit
import  UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let myRemoteNotification = MyRemoteNotification()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        myRemoteNotification.registerForPushNotifications()
        toMain()
        return true
    }
    
    private func toMain() {
        guard let window = window else { return }
        let viewController = RemoteNotifHomeViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
}
