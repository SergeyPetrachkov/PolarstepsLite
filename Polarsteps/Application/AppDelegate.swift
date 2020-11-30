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
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.initSession(window: window)
    self.window = window
    window.makeKeyAndVisible()
    return true
  }
}

extension AppDelegate: ISessionRouter {}

