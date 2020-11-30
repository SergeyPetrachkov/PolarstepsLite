import Foundation

public struct User {
  public let id: String
  public let firstName: String
  public let lastName: String
}

public extension User {
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

extension User: Codable {}
extension User: Identifiable {}
