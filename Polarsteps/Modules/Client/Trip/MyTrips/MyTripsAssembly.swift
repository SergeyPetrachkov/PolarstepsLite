//
//  MyTripsAssembly.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import Foundation

final class MyTripsAssembly {
  func createModule(moduleIn: MyTrips.ModuleIn = .init()) -> MyTripsController {
    let module = MyTripsController(moduleIn: moduleIn)
    let presenter = injectPresenter(moduleIn: moduleIn)
    presenter.view = module
    module.presenter = presenter
    presenter.output = module
    return module
  }

  func injectPresenter(moduleIn: MyTrips.ModuleIn) -> MyTripsPresenterInput {
    let presenter = MyTripsPresenter(moduleIn: moduleIn)
    let interactor = injectInteractor()
    presenter.interactor = interactor
    interactor.output = presenter
    presenter.router = injectRouter()
    return presenter
  }

  func injectInteractor() -> MyTripsInteractorInput {
    return MyTripsInteractor(repository: MyTripsRepository())
  }

  func injectRouter() -> MyTripsRouterInput {
    return MyTripsRouter()
  }
}
