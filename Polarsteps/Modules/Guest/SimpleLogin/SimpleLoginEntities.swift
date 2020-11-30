//
//  SimpleLoginEntities.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import Foundation

enum SimpleLogin {
  struct ModuleIn {
    let email: String
    let password: String
  }

  enum ModuleErrors: Error, CustomNSError, LocalizedError {
    case invalidInput

    var errorCode: Int {
      return 101
    }

    static var errorDomain: String = "PolarSteps.Light.SimpleLogin"

    var errorDescription: String? {
      return "Login and password cannot be empty!".localized
    }
  }
}
