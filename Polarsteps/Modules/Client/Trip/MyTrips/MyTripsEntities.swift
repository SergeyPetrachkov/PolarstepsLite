//
//  MyTripsEntities.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import SiberianVIPER

enum MyTrips {

  struct ModuleIn {}
  struct FetchRequest {}

  struct FetchResponse {
    let originalRequest: FetchRequest
    let items: [CollectionItemPresenter]
  }

  final class ViewModel: CollectionViewModel {
    var isBusy: Bool = false

    var batchSize: Int = 40

    var items: [CollectionItemPresenter] = []

    var changeSet: [CollectionChange] = []

    var moduleContext: ModuleIn

    var currentSkip: Int = 0

    var searchTerm: String?

    init(moduleIn: ModuleIn) {
      self.moduleContext = moduleIn
    }

    func prepareFetchRequest() -> FetchRequest {
      .init()
    }
  }
}
