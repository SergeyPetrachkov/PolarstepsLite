import Foundation

// MARK: - AllTripsResponse
public struct GetTripsResponse: Codable {
  public let allTrips: [Alltrip]

  enum CodingKeys: String, CodingKey {
    case allTrips = "alltrips"
  }
}

// MARK: - Alltrip
public struct Alltrip: Codable {
  public let allSteps: [Step]
  public let coverPhoto: CoverPhoto
  public let coverPhotoPath, coverPhotoThumbPath: String
  public let creationTime: Double
  public let endDate: Int
  public let id: Int
  public let isDeleted: Bool
  public let likes: Int
  public let name: String
  public let plannedStepsVisible: Bool
  public let slug: String
  public let startDate, stepCount: Int
  public let summary, timezoneID: String
  public let totalKM: Double
  public let userID: Int
  public let uuid: String
  public let views, visibility: Int

  enum CodingKeys: String, CodingKey {
    case allSteps = "all_steps"
    case coverPhoto = "cover_photo"
    case coverPhotoPath = "cover_photo_path"
    case coverPhotoThumbPath = "cover_photo_thumb_path"
    case creationTime = "creation_time"
    case endDate = "end_date"
    case id
    case isDeleted = "is_deleted"
    case likes, name
    case plannedStepsVisible = "planned_steps_visible"
    case slug
    case startDate = "start_date"
    case stepCount = "step_count"
    case summary
    case timezoneID = "timezone_id"
    case totalKM = "total_km"
    case userID = "user_id"
    case uuid, views, visibility
  }
}

// MARK: - AllStep
public struct Step: Codable {
  public let commentCount, creationTime: Int
  public let stepDescription: String
  public let id: Int
  public let isDeleted: Bool
  public let likes: Int
  public let location: Location
  public let locationID: Int
  public let mainMediaItemPath: String?
  public let name: String?
  public let slug: String?
  public let startTime: Int
  public let supertype: Supertype?
  public let timezoneID: String
  public let tripID: Int
  public let uuid: String
  public let views: Int
  public let weatherCondition: String?
  public let weatherTemperature: Int?

  enum CodingKeys: String, CodingKey {
    case commentCount = "comment_count"
    case creationTime = "creation_time"
    case stepDescription = "description"
    case id
    case isDeleted = "is_deleted"
    case likes, location
    case locationID = "location_id"
    case mainMediaItemPath = "main_media_item_path"
    case name
    case slug
    case startTime = "start_time"
    case supertype
    case timezoneID = "timezone_id"
    case tripID = "trip_id"
    case uuid, views
    case weatherCondition = "weather_condition"
    case weatherTemperature = "weather_temperature"
  }
}

// MARK: - Location
public struct Location: Codable {
  public let countryCode, detail: String
  public let fullDetail: String?
  public let id: Int
  public let lat, lon: Double
  public let name, uuid: String
  public let venue: String?

  enum CodingKeys: String, CodingKey {
    case countryCode = "country_code"
    case detail
    case fullDetail = "full_detail"
    case id, lat, lon, name, uuid, venue
  }
}

public enum Supertype: String, Codable {
  case normal = "normal"
}

// MARK: - CoverPhoto
public struct CoverPhoto: Codable {
  public let fullResUnavailable: Bool
  public let id: Int
  public let largeThumbnailPath: String
  public let lastModified: Double
  public let mediaID: Int
  public let path, smallThumbnailPath: String
  public let tripID, type: Int
  public let uuid: String

  enum CodingKeys: String, CodingKey {
    case fullResUnavailable = "full_res_unavailable"
    case id
    case largeThumbnailPath = "large_thumbnail_path"
    case lastModified = "last_modified"
    case mediaID = "media_id"
    case path
    case smallThumbnailPath = "small_thumbnail_path"
    case tripID = "trip_id"
    case type, uuid
  }
}

// MARK: - Follower
public struct Follower: Codable {
  public let currency, followerDescription: String
  public let fbID: Int
  public let firstName: String
  public let id: Int
  public let lastName: String
  public let livingLocation: Location
  public let livingLocationName, locale: String
  public let profileImagePath, profileImageThumbPath: String
  public let temperatureIsCelsius, unitIsKM: Bool
  public let username, uuid: String
  public let visibility: Int

  enum CodingKeys: String, CodingKey {
    case currency
    case followerDescription = "description"
    case fbID = "fb_id"
    case firstName = "first_name"
    case id
    case lastName = "last_name"
    case livingLocation = "living_location"
    case livingLocationName = "living_location_name"
    case locale
    case profileImagePath = "profile_image_path"
    case profileImageThumbPath = "profile_image_thumb_path"
    case temperatureIsCelsius = "temperature_is_celsius"
    case unitIsKM = "unit_is_km"
    case username, uuid, visibility
  }
}

// MARK: - Stats
public struct Stats: Codable {
  public let continents, countryCodes: [String]
  public let furthestPlaceFromHomeCountry: String
  public let furthestPlaceFromHomeKM: Int
  public let furthestPlaceFromHomeLocation: String
  public let kmCount: Double
  public let lastTripEndDate, likeCount, stepCount, timeTraveledInSeconds: Int
  public let tripCount, worldPercentage: Int

  enum CodingKeys: String, CodingKey {
    case continents
    case countryCodes = "country_codes"
    case furthestPlaceFromHomeCountry = "furthest_place_from_home_country"
    case furthestPlaceFromHomeKM = "furthest_place_from_home_km"
    case furthestPlaceFromHomeLocation = "furthest_place_from_home_location"
    case kmCount = "km_count"
    case lastTripEndDate = "last_trip_end_date"
    case likeCount = "like_count"
    case stepCount = "step_count"
    case timeTraveledInSeconds = "time_traveled_in_seconds"
    case tripCount = "trip_count"
    case worldPercentage = "world_percentage"
  }
}
