//
//  SimpleLoginViewModel.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//
import Foundation

protocol SimpleLoginVMOutput: AnyObject {
  func didEnterPendingState()
  func didExitPendingState()
  func didLogin()
  func didFail(with error: Error)
}

final class SimpleLoginViewModel {

  weak var output: SimpleLoginVMOutput?

  private let queue = DispatchQueue(label: "PolarSteps.Lite.SimpleLoginViewModelQueue")
  private let moduleIn: SimpleLogin.ModuleIn?

  private let api = DependenciesContainer.shared.flatApiClient
  private let storage = DependenciesContainer.shared.localStore

  init(_ moduleIn: SimpleLogin.ModuleIn?) {
    self.moduleIn = moduleIn
  }

  func submitCredentials(login: String?, password: String?) {
    self.output?.didEnterPendingState()
    guard let login = login, let password = password else {
      self.output?.didFail(with: SimpleLogin.ModuleErrors.invalidInput)
      return
    }
    self.queue.async {
      do {
        let loginResponse = try self.api.login(.init(login: login, password: password))
        self.storage.saveUser(.init(id: loginResponse.id, firstName: loginResponse.firstName, lastName: loginResponse.lastName))
        DispatchQueue.main.async {
          self.output?.didLogin()
        }
      } catch {
        DispatchQueue.main.async {
          self.output?.didFail(with: error)
        }
      }
    }
  }
}
