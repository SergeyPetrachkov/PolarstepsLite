//
//  DependenciesContainer.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import APIClient
import NetworkingCore
import Foundation

final class DependenciesContainer {

  static let shared = DependenciesContainer()

  private init() {}

  lazy var localStore = SimpleStorage()
  
  lazy var apiProvider: APIProvider = {
    let session = URLSession.shared
    let provider = APIProvider(requestExecutor: DefaultRequestExecutor(session: session))
    return provider
  }()

  lazy var apiClient = API(provider: self.apiProvider)
}
