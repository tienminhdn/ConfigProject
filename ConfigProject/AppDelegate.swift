//
//  AppDelegate.swift
//  ConfigProject
//
//  Created by T.Minh on 10/3/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: HomeViewControler())
        window?.makeKeyAndVisible()
        
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let langBundle = Bundle(path: path!)
        
        let hello = NSLocalizedString("hello", bundle: langBundle!, comment: "")
        print(hello)
        
        return true
    }
}
