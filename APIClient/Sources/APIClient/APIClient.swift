import NetworkingCore
import Entities
import Foundation

public class API {

  private let provider: APIProvider
  private let authHandler: ((String) -> Void)?

  public init(provider: APIProvider, authHandler: ((String) -> Void)?) {
    self.provider = provider
    self.authHandler = authHandler
  }

  public func login(_ loginRequest: LoginRequest, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
    self.provider.request(.login(login: loginRequest.login, password: loginRequest.password), authHandler: self.authHandler, completion: completion)
  }

  public func getMyTrips(completion: @escaping (Result<GetTripsResponse, Error>) -> Void) {
    self.provider.request(.myTrips(), completion: completion)
  }

  public func getTripDetails(tripId: Int, completion: @escaping (Result<GetTripDetailsResponse, Error>) -> Void) {
    self.provider.request(.tripDetails(id: tripId), completion: completion)
  }
}

public class FlatAPI {
  private let provider: API

  public init(provider: API) {
    self.provider = provider
  }

  public func login(_ request: LoginRequest) throws -> LoginResponse {
    return try Networking.requestData(request, functor: self.provider.login)
  }

  public func getMyTrips() throws -> GetTripsResponse {
    return try Networking.requestData(functor: self.provider.getMyTrips)
  }

  public func getTripDetails(tripId: Int) throws -> GetTripDetailsResponse {
    return try Networking.requestData(tripId, functor: self.provider.getTripDetails)
  }
}
