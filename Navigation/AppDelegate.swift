//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialTabBarController: UITabBarController?
    var tabBarController = UITabBarController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        let loginVC = LogInViewController()
        let feedVC = ProgrammFeedViewController()
        let calculator = BackgroundCalculatorViewController()
        
        let firstNavController = UINavigationController(rootViewController: feedVC)

        let secondNavController = UINavigationController(rootViewController: loginVC)
        
        let thirdNavController = UINavigationController(rootViewController: calculator)
       
        if #available(iOS 13.0, *) {
            firstNavController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage.init(systemName: "house.fill"), selectedImage: UIImage.init(systemName: "house.fill"))
            secondNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "person.fill"), selectedImage: UIImage.init(systemName: "person.fill"))
            thirdNavController.tabBarItem = UITabBarItem(title: "Calculator", image: UIImage.init(systemName: "timer"), selectedImage: UIImage.init(systemName: "timer"))
        } else {
            firstNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
            secondNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
            thirdNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        }
        
        tabBarController.viewControllers = [firstNavController,secondNavController,thirdNavController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        print("Did Finish Launching")
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Resign Active")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Become Active")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Did enter Background")
        // 29 секунд, округлил с помощью перевода в Int (класс: BackgroundCalculator, 
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Did enter forground")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Will terminate")
    }
    
   
    
}
