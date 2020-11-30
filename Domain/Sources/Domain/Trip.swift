import Foundation

public struct Trip {
  public let id: String
  public let title: String
  public let steps: [TripStep]
}

extension Trip: Codable {}
extension Trip: Identifiable {}
