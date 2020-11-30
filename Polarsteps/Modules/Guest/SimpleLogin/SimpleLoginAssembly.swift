//
//  SimpleLoginAssembly.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import Foundation

enum SimpleLoginAssembly {
  static func createModule(moduleIn: SimpleLogin.ModuleIn? = nil) -> SimpleLoginController {
    let viewModel = SimpleLoginViewModel(moduleIn)
    let controller = SimpleLoginController(viewModel)
    return controller
  }
}
