import NetworkingCore
import Entities
import Foundation

public class API {

  private let provider: APIProvider

  public init(provider: APIProvider) {
    self.provider = provider
  }

  public func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
    
  }

  public func getMyTrips(completion: @escaping (Result<GetTripsResponse, Error>) -> Void) {

  }

  public func getTripDetails(tripId: Int, completion: @escaping (Result<GetTripDetailsResponse, Error>) -> Void) {

  }
}

public enum FlatAPI {
//  public static func getJobs() throws -> [Int] {
//    return try Networking.requestData(functor: API.getJobs)
//  }
//
//  public static func getJobDetails(id: Int) throws -> Post {
//    return try Networking.requestData(id, functor: API.postDetails)
//  }
//
//  public static func getUserDetails(id: String) throws -> User {
//    return try Networking.requestData(id, functor: API.userDetails)
//  }
}
