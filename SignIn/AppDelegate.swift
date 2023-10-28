//
//  AppDelegate.swift
//  SignIn
//
//  Created by Tekla Matcharashvili on 27.10.23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: initialViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}


