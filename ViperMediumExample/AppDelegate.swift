//
//  AppDelegate.swift
//  ViperMediumExample
//
//  Created by Ferhan Akkan on 16.01.2021.
//

import UIKit
import QuickApi

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: LocationRouter().controller)
        window?.makeKeyAndVisible()
        
        Quick.shared.setApiBaseUrl(url: "https://api.openweathermap.org/data/2.5/")
        Quick.shared.timeOutTime = 20
        return true
    }
}

