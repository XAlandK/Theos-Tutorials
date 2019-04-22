//
//  AppDelegate.swift
//  Theos Tutorials
//
//  Created by Aland Kawa on 7/24/16.
//  Copyright © 2016 Aland Kawa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        sleep(2)
        
        let navigationAppearance = UINavigationBar.appearance()
        let navbarFont = UIFont(name: "Ubuntu", size: 17) ?? UIFont.systemFont(ofSize: 17)
        
        
        navigationAppearance.tintColor = UIColor.white
        navigationAppearance.titleTextAttributes = [NSAttributedString.Key.font: navbarFont, NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationAppearance.barTintColor = UIColor(red: 0.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        
        
        let AlertOnce = UserDefaults.standard
        if(!AlertOnce.bool(forKey: "oneTimeAlert")){
            
            let alertController = UIAlertController(title: nil, message: "There are some few bugs needs to be fixed, I'm going to fix them all soon as fast as possible!\nThanks\n\nAland Kawa", preferredStyle: .alert)
            let OKButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKButton)
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            AlertOnce.set(true , forKey: "oneTimeAlert")
            AlertOnce.synchronize()
        }
        return true
    }

    
    
    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}

