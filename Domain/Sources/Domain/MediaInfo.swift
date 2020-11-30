import Foundation

public struct MediaInfo {
  public let id: String
  public let imagePath: String
  public let videoPath: String?
}

extension MediaInfo: Codable {}
extension MediaInfo: Identifiable {}
