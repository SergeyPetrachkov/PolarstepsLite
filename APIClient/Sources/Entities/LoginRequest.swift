//
//  File.swift
//  
//
//  Created by sergey on 30.11.2020.
//

import Foundation

public struct LoginRequest {
  public let login: String
  public let password: String

  public init(login: String, password: String) {
    self.login = login
    self.password = password
  }
}
