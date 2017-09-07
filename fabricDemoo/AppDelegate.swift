//
//  AppDelegate.swift
//  fabricDemoo
//
//  Created by Yash Rathod on 06/09/17.
//  Copyright © 2017 Disha Technology. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import Appsee
import Optimizely
import Mapbox
import Branch
import ZendeskSDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Fabric.with([Crashlytics.self,Appsee.self,Optimizely.self,MGLAccountManager.self,Branch.self,Zendesk.self])
        // Enable verbose logging for Zendesk before Fabric initializes
        #if DEBUG
            ZDKLogger.enable(true)
        #endif

        Optimizely.start(withAPIToken: "AANj3MkBn_xXztnhorYWH5YfHMC6nrQ8~8653126353", launchOptions: launchOptions)
        // Authenticate anonymously as a Zendesk Support user
        let identity = ZDKAnonymousIdentity()
        identity.name = "John Bob"
        identity.email = "johnbob@example.com"
        ZDKConfig.instance().userIdentity = identity

        return true
    }
    func onUserDeposit() {
        Appsee.addEvent("UserDepositFinished")
        Appsee.addEvent("ItemPurchased", withProperties: ["Price"  : 100,
                                                          "Country": "USA"])

    }
    func onUserSessionStarted() {
        Appsee.setUserID("User1234")

    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if Optimizely.handleOpen(url) {
            return true;
        }
        return false;
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

