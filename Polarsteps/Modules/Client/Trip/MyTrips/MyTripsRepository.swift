//
//  MyTripsRepository.swift
//  Polarsteps
//
//  Created by sergey on 30.11.2020.
//

import Foundation
import APIClient
import Domain
import Entities

final class MyTripsRepository {
  func fetch() throws -> [Domain.Trip] {
    let trips = try DependenciesContainer.shared.flatApiClient.getMyTrips()
    return trips.allTrips.map { Trip(from: $0) }
  }
}

extension Trip {
  init(from dto: Entities.Alltrip) {
    let startDate = Date(timeIntervalSince1970: TimeInterval(dto.startDate))
    let endDate = Date(timeIntervalSince1970: TimeInterval(dto.endDate))
    self.init(id: dto.id,
              title: dto.name,
              steps: dto.allSteps.map { TripStep(from: $0) },
              isVisible: dto.visibility == 1,
              startDate: startDate,
              endDate: endDate,
              mediaInfo: .init(imagePath: dto.coverPhotoPath)
    )
  }
}

extension TripStep {
  init(from dto: Entities.Step) {
    let startDate = Date(timeIntervalSince1970: TimeInterval(dto.startTime))
    self.init(
      id: dto.id,
      title: "",
      body: dto.stepDescription,
      place: Place(
        country: .init(id: "", nativeName: dto.location.name, flag: dto.location.countryCode, code: dto.location.countryCode),
        location: Location.init(latitude: dto.location.lat, longitude: dto.location.lon, altitude: 0)
      ),
      media: [], date: startDate, weatherConditions: .init()
    )
  }
}
