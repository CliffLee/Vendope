//
//  AppDelegate.swift
//  daf
//
//  Created by Clifford Lee on 10/3/15.
//  Copyright © 2015 Clifford Lee. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var centerContainer: MMDrawerController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("tLbiqADD10mxnXGkav2u6gwCUXM5BMKbaH2rNB3z",
            clientKey: "TIIxiR1Un8N0HYbNov0EQmrUPcsoigkuF9CzazmT")
        
        //var rootViewController = self.window!.rootViewController
        
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        var centerViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
        
        var leftViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("LeftSideViewController") as! LeftSideViewController
        
        var rightViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("RightSideViewController") as! RightSideViewController
        
        var leftNav = UINavigationController(rootViewController: leftViewController)
        var centerNav = UINavigationController(rootViewController: centerViewController)
        var rightNav = UINavigationController(rootViewController: rightViewController)
        
        centerContainer = MMDrawerController(centerViewController: centerNav, leftDrawerViewController: leftNav, rightDrawerViewController: rightNav)
        
        centerContainer!.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView;
        centerContainer!.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView;
        
        window!.makeKeyAndVisible()
        
        return true
    }
    
    func setRootViewController() {
        window!.rootViewController = centerContainer
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

