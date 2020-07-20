//
//  AppDelegate.swift
//  YPShop
//
//  Created by Yury Podkutin on 17.07.2020.
//  Copyright © 2020 Yury Podkutin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let screenFrame = UIScreen.main.bounds
        self.window = UIWindow(frame: screenFrame)
        
        return true
    }
}

