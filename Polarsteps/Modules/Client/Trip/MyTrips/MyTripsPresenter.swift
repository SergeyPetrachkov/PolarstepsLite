//
//  MyTripsPresenter.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import UIKit
import SiberianVIPER

protocol MyTripsPresenterInput: CollectionPresenterInput, Startable {
  var output: MyTripsPresenterOutput? { get set }
  var view: UIViewController? { get set }
  var router: MyTripsRouterInput? { get set }
  var interactor: MyTripsInteractorInput? { get set }
}

protocol MyTripsPresenterOutput: AnyObject {
  func didChange(viewModel: MyTrips.ViewModel)
  func showError(with text: String)
  func didEnterPendingState()
  func didExitPendingState()
}

final class MyTripsPresenter: CollectionPresenter, MyTripsPresenterInput {

  weak var output: MyTripsPresenterOutput?
  weak var view: UIViewController?
  var router: MyTripsRouterInput?
  var interactor: MyTripsInteractorInput?
  var viewModel: MyTrips.ViewModel

  init(moduleIn: MyTrips.ModuleIn) {
    self.viewModel = .init(moduleIn: moduleIn)
    super.init(collectionModel: self.viewModel)
  }

  override func start() {
    self.interactor?.fetch(request: self.viewModel.prepareFetchRequest())
  }
}

extension MyTripsPresenter: MyTripsInteractorOutput {
  func didReceive(response: MyTrips.FetchResponse) {
    self.viewModel.items = response.items
    self.output?.didChange(viewModel: self.viewModel)
  }

  func didFail(with error: Error) {
    self.output?.showError(with: error.localizedDescription)
  }
}
