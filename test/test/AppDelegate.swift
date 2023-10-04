//
//  AppDelegate.swift
//  test
//
//  Created by Maheshashok Bijapur on 15/05/23.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let sharedInstance: Marketo = Marketo.sharedInstance()
        sharedInstance.initialize(withMunchkinID: "munchkin",
                                  appSecret: "secret",
                                  mobileFrameworkType: "native",// type
                                  launchOptions: launchOptions)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            UNUserNotificationCenter.current().delegate = self
            
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }
        return true
    }
  
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Marketo.sharedInstance().registerPushDeviceToken(deviceToken)
    }

        
    // MARK: Notification handling

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NSLog("didReceive response")
        Marketo.sharedInstance().userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        NSLog("willPresent notification")
        completionHandler([.sound, .alert,.badge])
    }
}

