//
//  SecureStorage.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

final class KeychainStore {

  static let shared = KeychainStore()

  private init() {
    
  }

  private let keychain = KeychainSwift()

  private enum Keychain {
    enum Keys {
      static let username = "username"
      static let password = "password"
      static let token = "token"
    }
  }

  func getToken() -> String? {
    return self.keychain.get(Keychain.Keys.token)
  }

  func setToken(_ token: String) {
    self.keychain.set(token, forKey: Keychain.Keys.token)
  }

  func removeToken() {
    self.keychain.delete(Keychain.Keys.token)
  }

  func getPassword() -> String? {
    return self.keychain.get(Keychain.Keys.password)
  }

  func setPassword(_ password: String) {
    self.keychain.set(password, forKey: Keychain.Keys.password)
  }

  func reset() {
    self.keychain.clear()
  }
}
