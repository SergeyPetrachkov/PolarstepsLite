import Foundation

public struct TripStep {
  public let id: String
  public let title: String?
  public let body: String?
  public let place: Place
  public let media: [MediaInfo]
  public let date: Date
  public let weatherConditions: WeatherConditions
}

extension TripStep: Codable {}
extension TripStep: Identifiable {}
