//
//  AppDelegate.swift
//  YourLawyer
//
//  Created by mac pro retina on 1/28/18.
//  Copyright © 2018 mac pro retina. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseInstanceID
import UserNotifications
import FirebaseMessaging

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,UNUserNotificationCenterDelegate,MessagingDelegate
{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        // navigationBar title color
        UINavigationBar.appearance().barTintColor = UIColor.black
        //UINavigationBar.appearance().tintColor = .white
       // UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.font: UIFont(name: "CoconNextArabic-Light", size: 20)!]
      
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge] ) { (isGranted, err) in
            if err != nil {
                //something bad happend
            }else {
                UNUserNotificationCenter.current().delegate = self
                Messaging.messaging().delegate = self
              //registerForRemoteNotification()
                
                
             //  UIApplication.shared.registerForRemoteNotifications()
 
                
            }
        }

        // Override point for customization after application launch.
        
        //change the backgriund of nav bar
        let  navimage = UIImage(named: "back.png")
        UINavigationBar.appearance().setBackgroundImage(navimage, for: .default)
        
        return true
    }
    func ConnectToFCM()
    {
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead ofapplicationWillTerminate: when the user quits.
        
        
        Messaging.messaging().shouldEstablishDirectChannel = false
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        self.ConnectToFCM()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        
    }
 

    func application(_ application: UIApplication, willChangeStatusBarFrame newStatusBarFrame: CGRect) {
        let windows = UIApplication.shared.windows
        for window in windows {
            window.removeConstraints(window.constraints)
        }
    }
    
  func messaging(_messaging : Messaging,didRefreshRegistrationToken fcmToken:String)
    {
        let newToken = InstanceID.instanceID().token()
        self.ConnectToFCM()
    }
}

