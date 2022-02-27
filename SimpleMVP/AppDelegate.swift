//
//  AppDelegate.swift
//  SimpleMVP
//
//  Created by 大塚周 on 2022/02/13.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = RootViewController()
        
        let presenter = RootPresenter(view: rootViewController)
        rootViewController.inject(presenter: presenter)

        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: RootViewController {
        return window!.rootViewController as! RootViewController
    }
    var router: Router { Router() }
    
}
//
//extension UIViewController {
//    var routerDelegate: RouterDelegate? {
//        AppDelegate.shared.routerDelegate
//    }
//}
