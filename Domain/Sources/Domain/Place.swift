import Foundation

public struct Place {
  public let country: Country
  public let location: Location
}

extension Place: Codable {}
