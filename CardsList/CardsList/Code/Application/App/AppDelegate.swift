//
//  AppDelegate.swift
//  CardsList
//
//  Created by Sergey Tszyu on 15.06.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        RealmController.shared.setup()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        AppNavigator.setupRootViewController(for: window)
        
        return true
    }
    
}

