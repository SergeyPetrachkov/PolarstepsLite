import Foundation

public struct User {

  public let id: Int
  public let firstName: String
  public let lastName: String

  public init(id: Int, firstName: String, lastName: String) {
    self.id = id
    self.firstName = firstName
    self.lastName = lastName
  }
}

public extension User {
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
}

extension User: Codable {}
extension User: Identifiable {}
