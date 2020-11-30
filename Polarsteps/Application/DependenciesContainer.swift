//
//  DependenciesContainer.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import APIClient
import NetworkingCore
import Foundation
import Entities

final class DependenciesContainer {

  static let shared = DependenciesContainer()

  private init() {}

  lazy var localStore = SimpleStorage()

  lazy var session: URLSession = {
    let configuration = URLSessionConfiguration.default
    self.localStore.restoreCookies()
    return URLSession(configuration: configuration)
  }()

  lazy var apiProvider: APIProvider = {
    let provider = APIProvider(requestExecutor: DefaultRequestExecutor(session: self.session))
    return provider
  }()


  lazy var apiClient = API(provider: self.apiProvider, authHandler: self.setCookies(_:))

  lazy var flatApiClient = FlatAPI(provider: self.apiClient)

  func setCookies(_ cookies: String) {
    print("Saving cookie...")
    if let cookies = session.configuration.httpCookieStorage?.cookies {
      self.localStore.setCookies(cookies)
    }
  }
}
