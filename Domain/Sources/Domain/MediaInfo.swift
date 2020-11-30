import Foundation

public struct MediaInfo {
  public let id: String
  public let imagePath: String
  public let videoPath: String?

  public init(id: String = "", imagePath: String, videoPath: String? = nil) {
    self.id = id
    self.imagePath = imagePath
    self.videoPath = videoPath
  }
}

extension MediaInfo: Codable {}
extension MediaInfo: Identifiable {}
