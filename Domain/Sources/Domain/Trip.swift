import Foundation

public struct Trip {
  public let id: Int
  public let title: String
  public let steps: [TripStep]
  public let isVisible: Bool
  public let startDate: Date
  public let endDate: Date
  public let media: MediaInfo

  public init(id: Int, title: String, steps: [TripStep], isVisible: Bool, startDate: Date, endDate: Date, mediaInfo: MediaInfo) {
    self.id = id
    self.title = title
    self.steps = steps
    self.isVisible = isVisible
    self.startDate = startDate
    self.endDate = endDate
    self.media = mediaInfo
  }
}

extension Trip: Codable {}
extension Trip: Identifiable {}
