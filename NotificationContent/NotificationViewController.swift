//
//  NotificationViewController.swift
//  NotificationContent
//
//  Created by sun on 26/09/2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    let center = UNUserNotificationCenter.current()

    func didReceive(_ notification: UNNotification) {
        center.getNotificationCategories { category in
            print("------ debug ------- category = ", category)
        }
        
        let categoryIdentifier = notification.request.content.categoryIdentifier
        if categoryIdentifier == "myNotificationCategory1" {
            print("------- debug -------- notification = myNotificationCategory1")

            let backAction = UNTextInputNotificationAction(identifier: "replyAction", title: "Reply", options: [])
            let nextAction = UNNotificationAction(identifier: "closeAction", title: "Close", options: [])
            let tutorialCategory = UNNotificationCategory(identifier: "myNotificationCategory1",
                                                          actions: [backAction, nextAction],
                                                          intentIdentifiers: [],
                                                          options: [])
            center.setNotificationCategories([tutorialCategory])
            center.setNotificationCategories([tutorialCategory])
        }
        else {
            print("------- debug -------- notification = myNotificationCategory2")
            let backAction = UNNotificationAction(identifier: "backAction", title: "Back", options: [])
            let nextAction = UNNotificationAction(identifier: "nextAction", title: "Next", options: [])
            let tutorialCategory = UNNotificationCategory(identifier: "myNotificationCategory2",
                                                          actions: [backAction, nextAction],
                                                          intentIdentifiers: [],
                                                          options: [])
            center.setNotificationCategories([tutorialCategory])
            center.setNotificationCategories([tutorialCategory])
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("------- debug -------- NotificationViewController -------- viewDidDisappear")
//        center.setNotificationCategories([])
    }
}
