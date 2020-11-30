import Foundation

public struct Place {
  public let country: Country
  public let location: Location

  public init(country: Country, location: Location) {
    self.country = country
    self.location = location
  }
}

extension Place: Codable {}
