//
//  appDelegate.swift
//  PainT
//
//  Created by 최승희 on 8/25/24.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Unity.shared.setHostMainWindow(window)

        return true
    }
}
