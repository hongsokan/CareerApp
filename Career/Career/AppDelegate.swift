//
//  AppDelegate.swift
//  Career
//
//  Created by 안홍석 on 2020/06/11.
//  Copyright © 2020 안홍석. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

//    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let companyListVC = ViewController()
        let calendarVC = CalendarViewController()
        let mypageVC = MypageViewController()
        
        companyListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        calendarVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        mypageVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

//        companyListVC.view.backgroundColor = UIColor.white
//        calendarVC.view.backgroundColor = UIColor.white
//        mypageVC.view.backgroundColor = UIColor.white
        
        let tb = UITabBarController()
        tb.setViewControllers([companyListVC, calendarVC, mypageVC], animated: true)
        tb.tabBar.backgroundColor = UIColor.black
        
        window!.rootViewController = tb
        window!.makeKeyAndVisible()
    */
        
        return true
    }

    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

