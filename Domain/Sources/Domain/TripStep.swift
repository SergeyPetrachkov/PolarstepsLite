import Foundation

public struct TripStep {
  public let id: Int
  public let title: String?
  public let body: String?
  public let place: Place
  public let media: [MediaInfo]
  public let date: Date
  public let weatherConditions: WeatherConditions

  public init(id: Int, title: String?, body: String?, place: Place, media: [MediaInfo], date: Date, weatherConditions: WeatherConditions) {
    self.id = id
    self.title = title
    self.body = body
    self.place = place
    self.media = media
    self.date = date
    self.weatherConditions = weatherConditions
  }
}

extension TripStep: Codable {}
extension TripStep: Identifiable {}
