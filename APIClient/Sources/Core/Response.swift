import Foundation

public struct Response {
  public let statusCode: StatusCode
  public let data: Data?

  public init(statusCode: StatusCode, data: Data?) {
    self.statusCode = statusCode
    self.data = data
  }
}
