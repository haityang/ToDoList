//
//  AppDelegate.swift
//  todolist
//
//  Created by yht on 2/27/16.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit
import DrawerController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var drawerController: DrawerController!


    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let leftSideDrawerViewController = TLeftTitleVC()
        let centerViewController = TListMsgController(nibName:"TListMsgController", bundle: nil)
//        let rightSideDrawerViewController = TNewMsgController()
        
        let navigationController = UINavigationController(rootViewController: centerViewController)
        navigationController.restorationIdentifier = "CenterNavigationControllerRestorationKey"
        
//        let rightSideNavController = UINavigationController(rootViewController: rightSideDrawerViewController)
//        rightSideNavController.restorationIdentifier = "RightNavigationControllerRestorationKey"
        
        let leftSideNavController = UINavigationController(rootViewController: leftSideDrawerViewController)
        leftSideNavController.restorationIdentifier = "LeftNavigationControllerRestorationKey"
        
        self.drawerController = DrawerController(centerViewController: navigationController, leftDrawerViewController: leftSideNavController, rightDrawerViewController: nil)
        self.drawerController.showsShadows = false
        
        self.drawerController.restorationIdentifier = "Drawer"
        self.drawerController.maximumRightDrawerWidth = 200.0
        self.drawerController.openDrawerGestureModeMask = .all
        self.drawerController.closeDrawerGestureModeMask = .all
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tintColor = UIColor(red: 29 / 255, green: 173 / 255, blue: 234 / 255, alpha: 1.0)
        self.window?.tintColor = tintColor

        self.window?.rootViewController = self.drawerController
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        
        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    

}

