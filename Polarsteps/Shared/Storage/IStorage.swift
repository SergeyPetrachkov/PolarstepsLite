//
//  IStorage.swift
//  Polarsteps
//
//  Created by sergey on 28.11.2020.
//

import Foundation
import Domain

protocol IStorage {
  // MARK: - User
  func getUser() -> User?
  func saveUser(_ user: User)

  // MARK: - Trips
  func getMyTrips() -> [Trip]
  func createTrip(_ trip: Trip)
  func updateTrip(_ trip: Trip)
  func deleteTrip(_ trip: Trip)
}
