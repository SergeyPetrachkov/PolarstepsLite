import NetworkingCore

public extension APIEndpoint {
  static var basePath: String {
    "https://www.polarsteps.com/"
  }

  static func login(login: String, password: String) -> APIEndpoint {
    return .init(path: basePath + "login", method: .post, parameters: ["username": login, "password": password])
  }

  static func myTrips() -> APIEndpoint {
    return .init(path: basePath + "currentuser", method: .get)
  }

  static func tripDetails(id: Int) -> APIEndpoint {
    return .init(path: basePath + "api/trips/\(id)", method: .get)
  }
}
