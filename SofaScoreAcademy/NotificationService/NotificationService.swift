//
//  NotificationService.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import Foundation
import UserNotifications

class NotificationService: NSObject, UNUserNotificationCenterDelegate {

    static let shared = NotificationService()

    override init() {
        super.init()
        notificationCenter.delegate = self
    }

    let notificationCenter = UNUserNotificationCenter.current()

    func notificationRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { didAllow, error in
            if !didAllow {
                print("User has declined notifications")
            }
        }
    }

    func scheduleNotification(notificationType: String) {
        let content = UNMutableNotificationContent()
        content.title = notificationType
        content.body = "You starred an event. Congratulations!!!"
        content.sound = .default
        content.badge = 1

//        let trigger = UNCalendarNotificationTrigger(dateMatching: <#T##DateComponents#>, repeats: <#T##Bool#>)
//        let trigger = UNLocationNotificationTrigger(region: <#T##CLRegion#>, repeats: <#T##Bool#>)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request, withCompletionHandler: nil)
    }

    func removeNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
}
