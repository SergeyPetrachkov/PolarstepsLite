import Foundation

public struct LoginResponse: Codable {
  public let id: Int
  public let firstName: String
  public let lastName: String
  public let livingLocationName: String
  public let locale: String
  public let username: String
  public let uuid: String

  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case id
    case lastName = "last_name"
    case livingLocationName = "living_location_name"
    case locale
    case username
    case uuid
  }
}
