//
//  AppDelegate.swift
//  Polarsteps
//
//  Created by sergey on 27.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = SimpleLoginAssembly.createModule()
    window.makeKeyAndVisible()
    self.window = window
    return true
  }
}

