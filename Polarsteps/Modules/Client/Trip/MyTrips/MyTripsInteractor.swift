//
//  MyTripsInteractor.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import Foundation

protocol MyTripsInteractorInput: AnyObject {
  var output: MyTripsInteractorOutput? { get set }
  func fetch(request: MyTrips.FetchRequest)
}

protocol MyTripsInteractorOutput: AnyObject {
  func didReceive(response: MyTrips.FetchResponse)
  func didFail(with error: Error)
}

final class MyTripsInteractor: MyTripsInteractorInput {

  private let queue = DispatchQueue(label: "PolarSteps.Lite.MyTripsInteractorQueue")
  weak var output: MyTripsInteractorOutput?
  private let repo: MyTripsRepository

  init(repository: MyTripsRepository) {
    self.repo = repository
  }

  func fetch(request: MyTrips.FetchRequest) {
    self.queue.async {
      do {
        let items = try self.repo.fetch()
        let mappedItems = items.map { TripCellPresenter($0) }
        DispatchQueue.main.async {
          self.output?.didReceive(response: .init(originalRequest: request, items: mappedItems))
        }
      } catch {
        DispatchQueue.main.async {
          self.output?.didFail(with: error)
        }
      }
    }
  }
}
