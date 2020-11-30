import Foundation

public struct Comment {
  public let id: String
  public let author: User
  public let content: String
}

extension Comment: Codable {}
extension Comment: Identifiable {}
