//
//  SimpleLoginViewModel.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

protocol SimpleLoginVMOutput: AnyObject {
  func didEnterPendingState()
  func didExitPendingState()
  func didFail(with error: Error?)
}

final class SimpleLoginViewModel {

  weak var output: SimpleLoginVMOutput?

  private let moduleIn: SimpleLogin.ModuleIn?

  private let api = DependenciesContainer.shared.apiClient

  init(_ moduleIn: SimpleLogin.ModuleIn?) {
    self.moduleIn = moduleIn
  }

  func submitCredentials(login: String?, password: String?) {
    self.output?.didEnterPendingState()
    guard let login = login, let password = password else {
      self.output?.didFail(with: SimpleLogin.ModuleErrors.invalidInput)
      return
    }
    self.api.login(username: login, password: password) { result in

    }
  }
}
