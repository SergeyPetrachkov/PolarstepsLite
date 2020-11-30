import Foundation

public struct Country {
  public let id: String
  public let nativeName: String
  public let flag: String
  public let code: String
}

extension Country: Codable {}
extension Country: Identifiable {}
