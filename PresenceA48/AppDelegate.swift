//
//  AppDelegate.swift
//  PresenceA48
//

import UIKit
import Parse
import ParseUI
import FBSDKCoreKit
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var overlay : UIView?
    var parseLoginHelper: ParseLoginHelper!
    
    override init()
    {
        super.init()
        
        parseLoginHelper = ParseLoginHelper {[unowned self] user, error in
            // Initialize the ParseLoginHelper with a callback
            if let _ = user
            {
                // if login was successful, display the TabBarController
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateViewControllerWithIdentifier("MainViewController")

                self.window?.rootViewController!.presentViewController(tabBarController, animated:true, completion:nil)
            }
            else if let err = error { ErrorHanlding.displayError((self.window?.inputViewController)!, error: err) }
        }
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
//        ESTConfig.setupAppID("presence-a48", andAppToken: "1f15bfbc76eb65f76fc96ffdef4eb7e8")
        
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("wIP2XuICQ0XllXuJyCTccLVtyQvdBcqrKCdQnnOD",
            clientKey: "If47RIuAnNCHbVrVORfzkOq2yrAdNdTw8XgwYsib")
        
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        // Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        let user = PFUser.currentUser()

        var startViewController = UIViewController()
        
        if (user != nil)
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            startViewController = storyboard.instantiateViewControllerWithIdentifier("MainViewController")
        }
        else
        {
            let loginViewController = PFLogInViewController()
            loginViewController.fields = PFLogInFields.Facebook
            loginViewController.delegate = parseLoginHelper
            loginViewController.facebookPermissions = ["email","public_profile"]
            
            // TODO: 
            startViewController = loginViewController
        }
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = startViewController
        self.window?.makeKeyAndVisible()
        
        let acl = PFACL()
        acl.setPublicReadAccess(true)
        PFACL.setDefaultACL(acl, withAccessForCurrentUser: true)
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
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
        FBSDKAppEvents.activateApp()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate: PFLogInViewControllerDelegate {}