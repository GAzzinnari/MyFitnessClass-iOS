//
//  AppDelegate.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/15/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Window instantiation, setup
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        // Root view controller setup
        let loginController = LoginController()
        let mainController = BarlessNavigationController(rootViewController: loginController)
        loginController.windowDelegate = self
        self.window?.rootViewController = mainController
        return true
    }

}

extension AppDelegate: WindowDelegate {
    // MARK: WindowDelegate
    func setRootController(_ viewController: UIViewController) {
        let rootController = self.window?.rootViewController as! BarlessNavigationController
        rootController.popToRootViewController(animated: true)
        rootController.pushViewController(viewController, animated: true)
    }
}
