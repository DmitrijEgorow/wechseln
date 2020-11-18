//
//  AppDelegate.swift
//  Wechseln
//
//  Created by Дмитрий Егоров on 08.11.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

import CoreData
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // FirebaseApp.configure()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: MissionSelectViewController())
        self.window?.makeKeyAndVisible()
        //let p = UIViewController()
        //p.view.backgroundColor = .purple
        //window?.rootViewController = p
        
        
        
        
        return true
    }

}

