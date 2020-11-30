import Foundation

public struct Location {
  public let latitude: Double
  public let longitude: Double
  public let altitude: Double

  public init(latitude: Double, longitude: Double, altitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
    self.altitude = altitude
  }
}

extension Location: Codable {}
