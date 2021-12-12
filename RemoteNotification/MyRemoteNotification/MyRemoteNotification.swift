//
//  MyRemoteNotification.swift
//  ExampleNotification
//
//  Created by Sun on 02/11/2021.
//

import  UserNotifications

final class MyRemoteNotification: NSObject {
    
    // MARK: - Property
    let notificationCenter = UNUserNotificationCenter.current()
    
    // MARK: - Func
    func registerForPushNotifications() {
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
        }
    }
    
    func handingNavigatorData(userInfo: [AnyHashable : Any]) {
        if let jsonData = userInfo["navigator"] as? [String : Any] {
            let result = Parser.decodable(json: jsonData, result: Navigator.self)
            switch result {
            case .success(let navigator):
                navigator.navigationAction()
            case .failure:
                break
            }
        }
    }
}

extension MyRemoteNotification: UNUserNotificationCenterDelegate {

    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       willPresent notification: UNNotification,
                                       withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter,
                                       didReceive response: UNNotificationResponse,
                                       withCompletionHandler completionHandler: @escaping () -> Void) {
        let notification = response.notification
        let request = notification.request
        let content = request.content
        let userInfo = content.userInfo
        handingNavigatorData(userInfo: userInfo)
        completionHandler()
    }
}
