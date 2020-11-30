//
//  SessionRouter.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit

protocol ISessionRouter {}

extension ISessionRouter {
  func showAuthorizedScenario(dependencies: DependenciesContainer) {
    let module = UINavigationController(rootViewController: MyTripsController(nibName: nil, bundle: nil))
    UIApplication.shared.delegate?.window??.set(rootViewController: module)
  }

  func logout() {
    // we can retrieve previously stored login/password here and paste into form, just in case
    // so it's not just the copy-paste from below
    let loginModule = SimpleLoginAssembly.createModule()
    UIApplication.shared.delegate?.window??.set(rootViewController: loginModule)
  }

  func initSession(window: UIWindow) {
    let dependencies = DependenciesContainer.shared
    if dependencies.localStore.getUser() != nil {
      self.showAuthorizedScenario(dependencies: dependencies)
    } else {
      let loginModule = SimpleLoginAssembly.createModule()
      UIApplication.shared.delegate?.window??.set(rootViewController: loginModule)
    }
  }
}
