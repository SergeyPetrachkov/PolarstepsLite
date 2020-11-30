import Foundation

public struct Location {
  public let latitude: Double
  public let longitude: Double
  public let altitude: Double
}

extension Location: Codable {}
