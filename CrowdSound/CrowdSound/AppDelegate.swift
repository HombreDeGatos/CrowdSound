//
//  AppDelegate.swift
//  CrowdSound
//
//  Created by Terin Patel-Wilson on 3/6/15.
//  Copyright (c) 2015 cs439. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Set up shared authentication information
        let auth = SPTAuth.defaultInstance()
        auth.clientID = kClientId
        
        auth.requestedScopes = [SPTAuthStreamingScope]
        
        auth.redirectURL = NSURL(string: kCallbackURL)
        auth.tokenSwapURL = NSURL(string: kTokenSwapServiceURL)
        auth.tokenRefreshURL = NSURL(string: kTokenRefreshServiceURL)
        auth.sessionUserDefaultsKey = kSessionUserDefaultsKey
        return true

        // FB Login
        // TODO: Uncomment!!! to figure out facebook
//        NSLog("options = \(launchOptions)")
//        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
        
        // Objective-C code
//        SPTAuth *auth = [SPTAuth defaultInstance];
//        auth.clientID = @kClientId
//        ;
//        auth.requestedScopes = @[SPTAuthStreamingScope];
//        auth.redirectURL = [NSURL URLWithString:@kCallbackURL];
//        #ifdef kTokenSwapServiceURL
//        auth.tokenSwapURL = [NSURL URLWithString:@kTokenSwapServiceURL];
//        #endif
//        #ifdef kTokenRefreshServiceURL
//        auth.tokenRefreshURL = [NSURL URLWithString:@kTokenRefreshServiceURL];
//        #endif
//        auth.sessionUserDefaultsKey = @kSessionUserDefaultsKey;
//        return YES;
        
    }
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        // create string URL for multiple log ins
        var urlString : String! = url.absoluteString!
        if urlString == nil {
            urlString = ""
        }
        NSLog("urlString = \(urlString)")
        NSLog("url = \(url)")

        if urlString.rangeOfString("facebook") != nil { // facebook login
            NSLog("doing Facebook URL")
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        } else if urlString.rangeOfString("spotify") != nil {   // spotify login
            NSLog("doing Spotify URL")
            let auth = SPTAuth.defaultInstance()
            
            let authCallback = { (error : NSError?, session : SPTSession?) -> () in
                if (error != nil) {
                    NSLog("*** Auth Error \(error)")
                    return
                }
                auth.session = session
                NSNotificationCenter.defaultCenter().postNotificationName("sessionUpdated", object: self)
            }
            
            if auth.canHandleURL(url) {
                auth.handleAuthCallbackWithTriggeredAuthURL(url, callback: authCallback)
                return true
            }
            return false
        } else {
            NSLog("Shoudln't get here, not in either")
            return true
        }

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
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

