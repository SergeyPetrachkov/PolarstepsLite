import Foundation

public struct Country {
  public let id: String
  public let nativeName: String
  public let flag: String
  public let code: String

  public init(id: String, nativeName: String, flag: String, code: String) {
    self.id = id
    self.nativeName = nativeName
    self.flag = flag
    self.code = code
  }
}

extension Country: Codable {}
extension Country: Identifiable {}
